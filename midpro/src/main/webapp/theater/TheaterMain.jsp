<%@page import="Vo.TheaterVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Comparator"%>
<%@page import="Vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <!-- ë¬¸ì ì¸ì½ë©ì UTF-8ë¡ ì¤ì   -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>DGV</title> <!-- ë¬¸ì ì ëª© -->
    <style>
        /* ì ì²´ íë©´ ì¬ì´ì¦ */
        #main {
            position: relative;
            left: 2px;
        }

        body {
            margin: 0;
            width: 100%;
            overflow-x: hidden;
            /* overflow-y: auto; */
            background: black;
        }

        div {
            border: 2px solid black; /* ëª¨ë  div ììì ê²ìì íëë¦¬ ì¶ê° */
        }

        #TheaterMain {
            color: white;
            margin-left: 260px;
            width: 1360px;
            height: 400px;
            background-color: rgb(52, 52, 52);
            display: flex; /* Flexbox ì¬ì© */
            justify-content: center; /* ê°ë¡ ë°©í¥ ê°ì´ë° ì ë ¬ */
            align-items: center; /* ì¸ë¡ ë°©í¥ ê°ì´ë° ì ë ¬ */
        }

        .spot {
            display: flex; /* Flexbox ì¬ì© */
            align-items: center; /* ê°ë¡ ë°©í¥ ê°ì´ë° ì ë ¬ */
            width: 1280px;
            height: 330px;
            border-radius: 20px;
            border: solid white;
            justify-content: center;
        }

        .region {
            margin: 20px;
            border: none;
            display: flex; /* Flexbox ì¬ì© */
            flex-direction: column; /* ì¸ë¡ ë°©í¥ì¼ë¡ ì ë ¬ */
            align-items: center; /* ê°ë¡ ë°©í¥ ê°ì´ë° ì ë ¬ */
        }

        button {
            background: none; /* ë°°ê²½ ì ê±° */
            border: none; /* íëë¦¬ ì ê±° */
            color: inherit; /* ë¶ëª¨ ììì ê¸ê¼´ ìì ìì */
            padding: 0; /* í¨ë© ì ê±° */
            font: inherit; /* ë¶ëª¨ ììì ê¸ê¼´ ì¤íì¼ ìì */
            cursor: pointer; /* ì»¤ì ëª¨ì ë³ê²½ */
            margin: 5px 0; /* ë²í¼ ê°ì ê°ê²© */
        }
    </style>
</head>

<body>
    <div>
        <%@ include file="/main/Top.jsp" %>
    </div>
    <h2 class="movie">ìíê´ ì ë³´</h2>
    <br><br>
    <div id="TheaterMain">
        <div class="spot">
            <% 
                List<TheaterVO> thea = (List<TheaterVO>) request.getAttribute("thea");
                if (thea != null) {
                    // theater_id ê¸°ì¤ì¼ë¡ ì ë ¬
                    thea.sort(Comparator.comparing(TheaterVO::getTheater_id));

                    // ì§ì­ë³ ìíê´ì ì ì¥í  ë§µ ìì±
                    Map<String, List<TheaterVO>> regionMap = new LinkedHashMap<>();
                    for (TheaterVO tList : thea) {
                        String region = tList.getTheater_do(); // ì§ì­ ì ë³´
                        if (!regionMap.containsKey(region)) {
                            regionMap.put(region, new ArrayList<>()); // ì§ì­ì´ ìì¼ë©´ ì ë¦¬ì¤í¸ ìì±
                        }
                        regionMap.get(region).add(tList); // í´ë¹ ì§ì­ ë¦¬ì¤í¸ì ì¶ê°
                    }

                    // ì§ì­ë³ë¡ ë²í¼ ìì±
                    for (String region : regionMap.keySet()) {
            %>
            <div class="region">
                <h3><%= region %></h3> <!-- ì§ì­ ì´ë¦ íì -->
                <% 
                    for (TheaterVO tList : regionMap.get(region)) {
                %>
                <button type="button" onclick="location.href='<%=request.getContextPath()%>/theaterDetail.do?theater_name=<%=tList.getTheater_name() %>';">
                    <%= tList.getTheater_name() %>
                </button>
                <% 
                    }
                %>
            </div>
            <% 
                    }
                } else {
            %>
            <div>ë±ë¡ë ìíê´ ì ë³´ê° ììµëë¤.</div>
            <% 
                }
            %>  
        </div>
    </div>
    <%@ include file="/main/Bottom.jsp" %>
</body>

<script>
    // ë¬´ë¹ì°¨í¸, ìììì ì, ë¬´ë¹ì¶ì² í´ë¦­ ì ì ëë©ì´ì ì ì©
    document.addEventListener('DOMContentLoaded', function() {
        const header = document.querySelector('.header');
        const charts = document.querySelectorAll('.chart');
        const movieListButton = document.getElementById('movie-list'); // IDë¡ ë²í¼ ì í

        if (header) {
            header.addEventListener('click', function(event) {
                // í´ë¦­ë ììê° 'ë ë§ì ìíë³´ê¸°' ë²í¼ì´ ìë ëë§ ì ëë©ì´ì ì ì©
                if (event.target.closest('.menu-button')) {
                    charts.forEach((chart) => {
                        chart.classList.remove('show');
                        chart.classList.add('hide');
                    });

                    setTimeout(() => {
                        charts.forEach((chart, index) => {
                            setTimeout(() => {
                                chart.classList.remove('hide');
                                chart.classList.add('show');
                            }, index * 100);
                        });
                    }, 500);
                }
            });

            charts.forEach((chart, index) => {
                setTimeout(() => {
                    chart.classList.add('show');
                }, index * 100);
            });
        }
        const buttons = document.querySelectorAll('.menu-button');

        buttons.forEach(button => {
            button.addEventListener('click', function() {
                buttons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        const videoPlayerElement = document.querySelector('#movie_play video'); // <video> ìì ì í
        const sourcesElement = videoPlayerElement.getElementsByTagName('source'); // source ììë¥¼ ê°ì ¸ì´

        function movie_play() {
            const randomNum = Math.floor(Math.random() * sourcesElement.length); // ìì¤ì ê°ìì ë°ë¼ ëì ìì±
            return randomNum; // ëìë¥¼ ë°í
        }

        function loadRandomVideo() {
            const randomNum = movie_play(); // ëì ìì±

            // ëª¨ë  ìì¤ì srcë¥¼ ì´ê¸°í
            for (let i = 0; i < sourcesElement.length; i++) {
                sourcesElement[i].src = `sorce/ìì ìì¤íì¼${i + 1}.mp4`; // íì¼ ê²½ë¡ ìì 
            }

            // ì íë ìì¤ì srcë¥¼ ì¤ì 
            videoPlayerElement.src = sourcesElement[randomNum].src;

            // videoPlayerê° ë¹ëì¤ ììì¸ì§ íì¸
            if (videoPlayerElement instanceof HTMLVideoElement) {
                videoPlayerElement.load(); // ë¹ëì¤ ìì¤ ë³ê²½ í ë¹ëì¤ ë¡ë
                videoPlayerElement.play(); // ë¹ëì¤ ìë ì¬ì
            } else {
                console.error('videoPlayer is not a valid video element');
            }
        }

        loadRandomVideo(); // ëë¤ ë¹ëì¤ ë¡ë í¨ì í¸ì¶
    });
</script>
</html>

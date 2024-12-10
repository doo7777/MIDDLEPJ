package DaoInterface;

import java.util.List;

import Vo.ProductVO;

public interface ICartDao {
	//장바구니 추가
	public int insertProduct(ProductVO productVO);
	//장바구니 빼기
	public int deleteProduct(int product_ID);
	//전체 장바구니 보기
	public List<ProductVO> getAllProduct();
	//장바구니 검색
	public ProductVO getProduct(String Product_name);
	
}

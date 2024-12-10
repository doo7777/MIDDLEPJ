package DaoInterface;

import java.util.List;

import Vo.ProductVO;

public interface ICartDao {
	/**
	 * 장바구니에 제품 추가
	 * @param productVO
	 * @return
	 */
	public int insertCart(ProductVO productVO);
	/**
	 * 장바구니에 제품 빼기
	 * @param product_ID
	 * @return
	 */
	public int deleteCart(int product_ID);
	/**
	 * 장바구니 전체 조회
	 * @return
	 */
	public List<ProductVO> getAllProduct();
	
}

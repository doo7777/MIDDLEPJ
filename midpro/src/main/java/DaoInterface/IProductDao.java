package DaoInterface;

import java.util.List;

import Vo.ProductVO;

public interface IProductDao {
	/**
	 * 제품 등록하는 메서드
	 * @param productVO
	 * @return
	 */
	public int insertProduct(ProductVO productVO);
	/**
	 * 제품 삭제하는 메서드
	 * @param product_ID
	 * @return
	 */
	public int deleteProduct(int product_ID);
	/**
	 * 전체 상품 보여주는 메서드 
	 * @return
	 */
	public List<ProductVO> getAllProduct();
	/**
	 * 상품 이름으로 상품 정보를 보여주는 메서드
	 * @param product_name
	 * @return
	 */
	public ProductVO getProduct(String product_name);
	
}

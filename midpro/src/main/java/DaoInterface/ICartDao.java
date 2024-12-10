package DaoInterface;

import Vo.ProductVO;

public interface ICartDao {
	public int insertProduct(ProductVO productVO);
	
	public int deleteProduct(int );
	
}

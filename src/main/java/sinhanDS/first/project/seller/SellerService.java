package sinhanDS.first.project.seller;

import java.util.Map;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;

public interface SellerService {
	public SellerVO login(SellerVO vo);
	
	public int regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo);
	public Map getProductList(int seller_no);
	
	int seller_regist(SellerVO vo);
	boolean check_password(SellerVO vo);
	boolean dupId(String id);
	
}

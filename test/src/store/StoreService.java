package store;

import java.util.List;

public class StoreService {
	StoreDAO storeDAO;
	CartDAO cartDAO;
	
	public StoreService() {
		storeDAO = new StoreDAO();
	}
	
	//티켓 목록 조회
	public List<StoreBean> listStore1(){
		List<StoreBean> storeList = storeDAO.listStore1();
		return storeList;
	}
	
	//찬스 목록 조회
	public List<StoreBean> listStore2(){
		List<StoreBean> storeList = storeDAO.listStore2();
		return storeList;
	}
	
	//푸드 목록 조회
	public List<StoreBean> listStore3(){
		List<StoreBean> storeList = storeDAO.listStore3();
		return storeList;
	}	
	
	
	//상품 상세 보기
	public StoreBean viewStore(int item_code){
		StoreBean store = null;
		store = storeDAO.viewStore(item_code);
		return store;
	}
	
	//상품 추가하기
	public int addStore(StoreBean store){
		return storeDAO.insertNewStore(store);
	}
	
	//상품 삭제하기
	public List<Integer> removeStore(int item_code){
		List<Integer> itemCodeList = storeDAO.selectRemovedItems(item_code);
		storeDAO.deleteStore(item_code);
		return itemCodeList;
	}
	
	//상품 수정하기
	public void modStore(StoreBean store){
		storeDAO.updateStore(store);
	}
	
}//StoreService

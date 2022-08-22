package dev.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import dev.domain.Criteria;
import dev.domain.Reservations;
import dev.domain.Store;
import dev.repository.StoreRepository;

public class StoreService {
	/*
	 * Field
	 */
	private static StoreService storeService = new StoreService();
	StoreRepository storeRepository = new StoreRepository();

	/*
	 * Constructor
	 */
	private StoreService() {
	}

	public static StoreService getInstance() {
		return storeService;
	}

	/*
	 * Method
	 */
	public static StoreService getStoreService() {
		return storeService;
	}

	// 디테일 페이지에 사용 -> 사진 5장 전부
	public Store findOneStore(int storeId) {
		Store store = storeRepository.selectOne(storeId);
		// DB 의 store_img_url 의 '-'으로 구분된 한줄의 url 을 스플릿 하여 구분 지어 재설정
//      List<String> urlList = Arrays.asList(store.getStoreImgUrl().get(0).split("-"));
		store.setStoreImgUrl(Arrays.asList(store.getStoreImgUrl().get(0).split("-")));

		// 여기서 대표메뉴를 다시 세팅해줘요
		// 대표메뉴가 {아메리카노: 3000원 바닐라라떼: 2100원} 하나의 리스트를
		// --> {아메리카노: 3000원, 바닐라라떼: 2100원} 두개의 리스트로 변경
		store.setRepresentMenu(printMenu(store.getRepresentMenu().get(0)));
		return store;
	}

	public Store findOneStore(String storeName) {
		Store store = storeRepository.selectOne(storeName);
		// DB 의 store_img_url 의 '-'으로 구분된 한줄의 url 을 스플릿 하여 구분 지어 재설정
//	      List<String> urlList = Arrays.asList(store.getStoreImgUrl().get(0).split("-"));
		store.setStoreImgUrl(Arrays.asList(store.getStoreImgUrl().get(0).split("-")));

		// 여기서 대표메뉴를 다시 세팅해줘요
		// 대표메뉴가 {아메리카노: 3000원 바닐라라떼: 2100원} 하나의 리스트를
		// --> {아메리카노: 3000원, 바닐라라떼: 2100원} 두개의 리스트로 변경
		store.setRepresentMenu(printMenu(store.getRepresentMenu().get(0)));
		return store;
	}

	// 리스트페이지에 사용 -> 사진 한장
	private static List<Store> getRandomImg(List<Store> list) {

		// 사진 랜덤 지정
		for (Store store : list) {
			String url = Arrays.asList(store.getStoreImgUrl().get(0).split("-")).get((int) (Math.random() * 4));
			System.out.println(Arrays.asList(store.getStoreImgUrl().get(0).split("-")).get((int) (Math.random() * 4)));
			List<String> urlList = new ArrayList<String>();
			urlList.add(url);
			store.setStoreImgUrl(urlList);
		}
		return list;
	}

	private List<String> printMenu(String menu) {
		char[] arr = menu.toCharArray();
		int k = 0;
		String result = "";
		List<String> list = new ArrayList<>();

		for (int i = 0; i < arr.length; i++) {
			if (i == arr.length - 1) {
				result += arr[i];
				list.add(result);
			}
			if (arr[i] != ' ') {
				result += arr[i];
				continue;
			}
			if (++k == 2) {
				list.add(result);
				k = 0;
				result = "";
			}

		}
//		list.forEach(x -> System.out.println(x));
		return list;
	}

	/* 검색 */
	// 키워드 조회(페이지 추출)
	public List<Store> findAllStores(String keyword) {
		List<Store> list = storeRepository.searchKeyword(keyword);
		// 사진 url 세팅
		List<Store> newlist = getRandomImg(list);
		// System.out.println(newlist.get(0).getStoreImgUrl().get(0));
		return newlist;
	}

	// 필터 조회(페이지 추출)
	// order 추가 해야함
	public List<Store> findFilterStores(String keyword, String[] area, String[] food) {
		List<Store> list = storeRepository.searchFilter(keyword, area, food);
		List<Store> newlist = getRandomImg(list);
		return newlist;
	}

	// 키워드 조회-페이징
	public List<Store> findAllPagingStores(Criteria cri, String keyword) {
		List<Store> list = storeRepository.searchPagingkeyword(cri, keyword);
		// 사진 url 세팅
		List<Store> newlist = getRandomImg(list);
		return newlist;
	}

	// 필터 조회-페이징
	public List<Store> findAllFilterPagingStores(Criteria cri, String keyword, String[] area, String[] food) {
		List<Store> list = storeRepository.searchPagingkeywordFilter(cri, keyword, area, food);
		// 사진 url 세팅
		List<Store> newlist = getRandomImg(list);
		return newlist;
	}

	// 메인:랜덤 조회 수정
	public List<Store> findRandomStore() {
		List<Store> list = new ArrayList<>();
		Set<Store> set = new HashSet<Store>();
		while (set.size() < 6) {
			Store store = storeRepository.getStore();

			if(store == null || set.contains(store)) {
				continue;
			}
			set.add(store);
			list.add(store);
		}
		List<Store> newlist = getRandomImg(list);
		return newlist;
	}

	public List<Store> storeList() {
		return storeRepository.getList();
	}

	public List<Store> getListPaging(Criteria cri) {
		return storeRepository.getListPaging(cri);
	}

	public List<Store> acceptstoreList() {
		return storeRepository.getacceptList();
	}

	public List<Store> getacceptstoreList(Criteria cri) {
		return storeRepository.getacceptListPaging(cri);
	}

	public boolean removeStore(String store_name) {
		return storeRepository.deleteStore(store_name);
	}

	public boolean updateStore(String store_name) {
		return storeRepository.updateStore(store_name);
	}

	public void mypageupdatestore(Store st) {
		storeRepository.mypageupdatestore(st);
	}

	public Store storemanagement(String storeName) {
		Store store = storeRepository.storemanagement(storeName);
		return store;
	}

	// 가게 등록 - 점주 페이지
	public void registerStore(Store store) {
		storeRepository.insert(store);
	}

	public List<Reservations> getstorereservations(Criteria cri, String stroeName) {
		return storeRepository.getstorereservation(cri, stroeName);
	}

	public List<Reservations> reservationList(String stroeName) {
		return storeRepository.reservationList(stroeName);
	}
	
	// 0816_wana - 내가 등록한 점포들 조회
	public List<Store> findStoresByOwner(String memberId) {
		return storeRepository.selectStoreListMyMemberId(memberId);
	}

}

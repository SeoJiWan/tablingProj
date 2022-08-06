package dev.service;

import java.util.List;

import dev.domain.InterestedStore;
import dev.repository.InterestedStoreRepository;

public class InterestedStoreService {
	
	/*
	 * Field
	 */
	private static InterestedStoreService interestedStoreService = new InterestedStoreService();
	InterestedStoreRepository interestedStoreRepository = new InterestedStoreRepository();

	/*
	 * Constructor
	 */
	private InterestedStoreService() {}

	/*
	 * Method
	 */
	public static InterestedStoreService getInterestedStoreService() {
		return interestedStoreService;
	}
	
	// 찜하기
	public void pickStoreInMyPage(InterestedStore interestedStore) {
		interestedStoreRepository.insert(interestedStore);
	}
	
	// 찜해제
	public void deleteStoreInMyPage(InterestedStore interestedStore) {
		interestedStoreRepository.delete(interestedStore);
	}
	
	// 내가 찜한 목록 보기 -> 사진 url 은 한개만
	public List<InterestedStore> findAllPickStore(String memberId) {
		List<InterestedStore> list = interestedStoreRepository.selectAllByMemberId(memberId);
		for (InterestedStore store : list) {
			String url = store.getStoreImgUrl();
			store.setStoreImgUrl(url.substring(0, url.indexOf("-")));
		}
		return list;
	}

	public boolean addLike(InterestedStore interestedStore) {
		return interestedStoreRepository.likeAdd(interestedStore);
	}
	
}

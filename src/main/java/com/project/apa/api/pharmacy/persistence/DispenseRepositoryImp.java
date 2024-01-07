
package com.project.apa.api.pharmacy.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.stereotype.Repository;


/**
 * DispenseRepository 인터페이스를 구현한 DispenseRepositoryImp 클래스입니다.
 * Elasticsearch를 사용하여 검색을 수행하고 검색 결과를 반환합니다.
 * @author 김민정
 */
@Repository
public class DispenseRepositoryImp implements DispenseRepository {

	
	 /**
     * 주어진 단어를 사용하여 Elasticsearch에서 검색을 수행하는 메서드입니다.
     *
     * @param word 검색어
     * @return 검색 결과를 담은 Map 리스트
     */
	@Override
	public List<Map<String, Object>> search(String word) {
		try {

			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			
			// Elasticsearch 클라이언트 생성
			RestHighLevelClient client = new RestHighLevelClient(
					RestClient.builder(new HttpHost("localhost", 9200, "http")));

			// 인덱스 선택  // 검색 요청 생성
			SearchRequest searchRequest = new SearchRequest("dispense");

			SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder().size(100);

			// 검색 쿼리 구성
			searchSourceBuilder.query(QueryBuilders.boolQuery().must(QueryBuilders.matchQuery("username", word))
					.should(QueryBuilders.matchPhraseQuery("username", word)));

			searchRequest.source(searchSourceBuilder);

			// 실제 검색 요청
			SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);

			
			SearchHits searchHits = searchResponse.getHits();

			System.out.println("hits: " + searchHits.getHits().length);
			
			for (SearchHit hit : searchHits) {

				Map<String, Object> map = hit.getSourceAsMap();
				map.put("id", hit.getId());
				map.put("score", hit.getScore());
				list.add(map);

			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}

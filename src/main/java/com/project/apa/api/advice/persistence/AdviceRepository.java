
package com.project.apa.api.advice.persistence;

import java.util.List;
import java.util.Map;

public interface AdviceRepository {



	
	List<Map<String, Object>> search(String word);

}

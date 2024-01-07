
package com.project.apa.api.pharmacy.persistence;

import java.util.List;
import java.util.Map;

public interface DispenseRepository {



	List<Map<String, Object>> search(String word);

}

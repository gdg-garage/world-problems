
package io.github.gdggarage.worldproblems;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.api.server.spi.config.DefaultValue;
import com.google.api.server.spi.config.Named;
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;
import io.github.gdggarage.worldproblems.entity.Problem;

@Api(name = "problems", version = "v1")
public class ProblemsApi {

	static final String FIRST_SHEET = "https://spreadsheets.google" +
		".com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od6/public/values?alt=json";
	static final String SECOND_SHEET = "https://spreadsheets.google" +
		".com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od7/public/values?alt=json";

	@ApiMethod(path = "random", name = "random")
	public List<Problem> getRandom(@Named("ignore_first") @DefaultValue("-1") int ignoreFirst, @Named("ignore_third") @DefaultValue("-1") int
		ignoreThird) throws IOException {
		List<Problem> problems = new ArrayList<>();
		problems.add(ProblemsWorker.getRandom(FIRST_SHEET, ignoreFirst));
		problems.add(ProblemsWorker.getRandom(SECOND_SHEET, ignoreThird));
		return problems;
	}

	@ApiMethod(path = "refresh-cache", name = "refresh_cache", httpMethod = ApiMethod.HttpMethod.GET)
	public void refreshCache() throws IOException {
		MemcacheService cache = MemcacheServiceFactory.getMemcacheService();
		ProblemsWorker.downloadAndSaveToCache(cache, FIRST_SHEET);
		ProblemsWorker.downloadAndSaveToCache(cache, SECOND_SHEET);
	}

}

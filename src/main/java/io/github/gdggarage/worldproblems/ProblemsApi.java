
package io.github.gdggarage.worldproblems;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.api.server.spi.config.DefaultValue;
import com.google.api.server.spi.config.Named;
import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;
import com.google.gson.Gson;
import io.github.gdggarage.worldproblems.entity.Problem;
import io.github.gdggarage.worldproblems.parse.Document;
import io.github.gdggarage.worldproblems.parse.Entry;

@Api(name = "problems", version = "v1")
public class ProblemsApi {

	private static final String FIRST_SHEET = "https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od6/public/values?alt=json";
	private static final String SECOND_SHEET = "https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od7/public/values?alt=json";

	Random random = new Random();

	@ApiMethod(path = "random", name = "random")
	public List<Problem> getRandom(@Named("ignore_first") @DefaultValue("-1") int ignoreFirst, @Named("ignore_third") @DefaultValue("-1") int
		ignoreThird) throws IOException {
		List<Problem> problems = new ArrayList<>();
		problems.add(getRandom(FIRST_SHEET,ignoreFirst));
		problems.add(getRandom(SECOND_SHEET,ignoreThird));
		return problems;
	}

	@ApiMethod(path = "refresh-cache", name = "refresh_cache", httpMethod = ApiMethod.HttpMethod.GET)
	public void refreshCache() throws IOException {
		MemcacheService cache = MemcacheServiceFactory.getMemcacheService();
		downloadAndSaveToCache(cache, FIRST_SHEET);
		downloadAndSaveToCache(cache, SECOND_SHEET);
	}

	private Document downloadAndSaveToCache(MemcacheService cache, String sheetUrl) throws IOException {
		URL url = new URL(sheetUrl);
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
		Document doc = new Gson().fromJson(reader, Document.class);
		cache.put(sheetUrl, doc);
		return doc;
	}

	private Problem getRandom(String spreadsheetUrl, int ignore) throws IOException {
		MemcacheService cache = MemcacheServiceFactory.getMemcacheService();
		Document doc = (Document) cache.get(spreadsheetUrl);
		if (doc == null) {
			doc = downloadAndSaveToCache(cache, spreadsheetUrl);
		}
		boolean found = false;
		Entry entry = null;
		int size = doc.getEntries().size();
		while (!found) {
			int pos = random.nextInt(size);
			entry = doc.getEntries().get(pos);
			if (entry.getId() != ignore || size == 1) {
				found = true;
			}
		}
		return new Problem(entry.getId(), entry.getText(), entry.getAuthor(), entry.getSource(), entry.getUrl(), entry.getSubmitter());
	}
}

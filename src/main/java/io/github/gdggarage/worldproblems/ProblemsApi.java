
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
import com.google.gson.Gson;
import io.github.gdggarage.worldproblems.entity.Problem;
import io.github.gdggarage.worldproblems.parse.Document;
import io.github.gdggarage.worldproblems.parse.Entry;

/**
 * Defines v1 of a helloworld API, which provides simple "greeting" methods.
 */
@Api(name = "problems", version = "v1")
public class ProblemsApi {

	@ApiMethod(path = "random")
	public List<Problem> getRandom() throws IOException {
		List<Problem> problems = new ArrayList<>();
		problems.add(getRandom("https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od6/public/values?alt=json"));
		problems.add(getRandom("https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od7/public/values?alt=json"));
		return problems;
	}

	private Problem getRandom(String spreadsheetUrl) throws IOException {
		URL url = new URL(spreadsheetUrl);
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
		Document doc = new Gson().fromJson(reader, Document.class);
		int pos = new Random().nextInt(doc.getEntries().size());
		Entry e = doc.getEntries().get(pos);
		return new Problem(e.getId(), e.getText(), e.getAuthor(), e.getSource(), e.getUrl(), e.getSubmitter());
	}
}

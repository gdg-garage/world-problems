
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
import com.google.gson.Gson;
import io.github.gdggarage.worldproblems.entity.Problem;
import io.github.gdggarage.worldproblems.parse.Document;
import io.github.gdggarage.worldproblems.parse.Entry;

@Api(name = "problems", version = "v1")
public class ProblemsApi {

	Random random = new Random();

	@ApiMethod(path = "random")
	public List<Problem> getRandom(@Named("ignore_first") @DefaultValue("-1") int ignoreFirst, @Named("ignore_third") @DefaultValue("-1") int ignoreThird) throws IOException {
		List<Problem> problems = new ArrayList<>();
		problems.add(getRandom("https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od6/public/values?alt=json", ignoreFirst));
		problems.add(getRandom("https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od7/public/values?alt=json", ignoreThird));
		return problems;
	}

	private Problem getRandom(String spreadsheetUrl, int ignore) throws IOException {
		URL url = new URL(spreadsheetUrl);
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
		Document doc = new Gson().fromJson(reader, Document.class);
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

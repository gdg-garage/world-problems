
package com.google.devrel.samples.helloendpoints;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Random;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.devrel.samples.helloendpoints.entity.Document;
import com.google.devrel.samples.helloendpoints.entity.Entry;
import com.google.gson.Gson;

/**
 * Defines v1 of a helloworld API, which provides simple "greeting" methods.
 */
@Api(name = "problems", version = "v1")
public class Greetings {

	@ApiMethod(path = "random")
	public Problem getRandom() throws IOException {
		URL url = new URL("https://spreadsheets.google.com/feeds/list/0AjP0HrbVsp3KdDRFdHN5TVUweFNHV04zZ0g3T1dTTXc/od6/public/values?alt=json");
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
		Document doc = new Gson().fromJson(reader, Document.class);
		int pos = new Random().nextInt(doc.getEntries().size());
		Entry e = doc.getEntries().get(pos);


		return new Problem(e.getId(), e.getText(), e.getAuthor(), e.getSource(), e.getUrl(), e.getSubmitter());
	}
}

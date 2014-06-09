/**
 * Copyright (c) 2014, Inmite s.r.o. (www.inmite.eu). All rights reserved. 
 *
 * This source code can be used only for purposes specified by the given license contract 
 * signed by the rightful deputy of Inmite s.r.o. This source code can be used only 
 * by the owner of the license. 
 *
 * Any disputes arising in respect of this agreement (license) shall be brought 
 * before the Municipal Court of Prague. 
 */
package io.github.gdggarage.worldproblems;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Random;

import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;
import com.google.gson.Gson;
import io.github.gdggarage.worldproblems.entity.Problem;
import io.github.gdggarage.worldproblems.parse.Document;
import io.github.gdggarage.worldproblems.parse.Entry;

/**
 * Shared logic between API and JSP.
 * @author David Vávra (david@inmite.eu)
 */
public class ProblemsWorker {

	Problem firstProblem;
	Problem thirdProblem;

	public ProblemsWorker() {
		try {
			firstProblem = getRandom(ProblemsApi.FIRST_SHEET, -1);
			thirdProblem = getRandom(ProblemsApi.SECOND_SHEET, -1);
		} catch (IOException e) {
			// ignore
		}
	}

	public Problem first() {
		return firstProblem;
	}

	public Problem third() {
		return thirdProblem;
	}

	static Problem getRandom(String spreadsheetUrl, int ignore) throws IOException {
		MemcacheService cache = MemcacheServiceFactory.getMemcacheService();
		Document doc = (Document) cache.get(spreadsheetUrl);
		if (doc == null) {
			doc = downloadAndSaveToCache(cache, spreadsheetUrl);
		}
		boolean found = false;
		Entry entry = null;
		int size = doc.getEntries().size();
		while (!found) {
			int pos = new Random().nextInt(size);
			entry = doc.getEntries().get(pos);
			if (entry.getId() != ignore || size == 1) {
				found = true;
			}
		}
		return new Problem(entry.getId(), entry.getText(), entry.getAuthor(), entry.getSource(), entry.getUrl(), entry.getSubmitter());
	}

	static Document downloadAndSaveToCache(MemcacheService cache, String sheetUrl) throws IOException {
		URL url = new URL(sheetUrl);
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
		Document doc = new Gson().fromJson(reader, Document.class);
		cache.put(sheetUrl, doc);
		return doc;
	}
}

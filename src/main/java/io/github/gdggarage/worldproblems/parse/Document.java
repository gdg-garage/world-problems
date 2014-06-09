package io.github.gdggarage.worldproblems.parse;

import java.io.Serializable;
import java.util.List;

public class Document implements Serializable {
	public static class Feed implements Serializable {
		List<Entry> entry;
	}

	Feed feed;

	public List<Entry> getEntries() {
		return feed.entry;
	}
}

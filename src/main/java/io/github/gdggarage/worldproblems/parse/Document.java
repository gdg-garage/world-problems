package io.github.gdggarage.worldproblems.parse;

import java.util.List;

public class Document {
	public static class Feed{
		List<Entry> entry;
	}
	Feed feed;

	public List<Entry> getEntries(){
		return feed.entry;
	}
}

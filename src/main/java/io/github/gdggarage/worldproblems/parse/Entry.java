
package io.github.gdggarage.worldproblems.parse;

import com.google.gson.annotations.SerializedName;

public class Entry {
	public static class Value {
		@SerializedName("$t")
		String value;
	}

	@SerializedName("gsx$id")
	Value id;
	@SerializedName("gsx$text")
	Value text;
	@SerializedName("gsx$author")
	Value author;
	@SerializedName("gsx$source")
	Value source;
	@SerializedName("gsx$url")
	Value url;
	@SerializedName("gsx$submitter")
	Value submitter;

	public int getId() {
		return Integer.parseInt(id.value);
	}

	public String getText() {
		return text.value;
	}


	public String getAuthor() {
		return author.value;
	}


	public String getSource() {
		return source.value;
	}


	public String getUrl() {
		return url.value;
	}


	public String getSubmitter() {
		return submitter.value;
	}

}

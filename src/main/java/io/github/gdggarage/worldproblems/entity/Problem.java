
package io.github.gdggarage.worldproblems.entity;

public class Problem {

	private int id;
	private String text;
	private String author;
	private String source;
	private String url;
	private String submitter;

	public Problem() {
	};

	public Problem(int id,  String text, String author, String source, String url, String submitter) {
		this.id =  id;
		this.text = text;
		this.author = author;
		this.source = source;
		this.url = url;
		this.submitter = submitter;
	}


	public int getId() {
		return id;
	}

	public String getText() {
		return text;
	}

	public String getAuthor() {
		return author;
	}

	public String getSource() {
		return source;
	}

	public String getUrl() {
		return url;
	}

	public String getSubmitter() {
		return submitter;
	}

}

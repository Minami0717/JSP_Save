package gall;

public class RecoList {
	private int post_idx;
	private String user_ip;
	private String date;
	private boolean isReco;
	
	public boolean isReco() {
		return isReco;
	}
	public void setReco(boolean isReco) {
		this.isReco = isReco;
	}
	public int getPost_idx() {
		return post_idx;
	}
	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}
	public String getUser_ip() {
		return user_ip;
	}
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}

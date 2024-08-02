package com.chef.app.member;

public class MemberDTO {
	private String member_id;
	private String member_name;
	private String membere_mail;
	private String member_pwd;
	private String member_phone;
	private String member_nickname;
	private Long member_lev;
	private String profile_about_me;
	private String profile_sns_url;
	private Long profile_hit;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMembere_mail() {
		return membere_mail;
	}
	public void setMembere_mail(String membere_mail) {
		this.membere_mail = membere_mail;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public Long getMember_lev() {
		return member_lev;
	}
	public void setMember_lev(Long member_lev) {
		this.member_lev = member_lev;
	}
	public String getProfile_about_me() {
		return profile_about_me;
	}
	public void setProfile_about_me(String profile_about_me) {
		this.profile_about_me = profile_about_me;
	}
	public String getProfile_sns_url() {
		return profile_sns_url;
	}
	public void setProfile_sns_url(String profile_sns_url) {
		this.profile_sns_url = profile_sns_url;
	}
	public Long getProfile_hit() {
		return profile_hit;
	}
	public void setProfile_hit(Long profile_hit) {
		this.profile_hit = profile_hit;
	}
}




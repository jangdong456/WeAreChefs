package com.chef.app.member;

import java.sql.Date;
import java.util.List;

import com.chef.app.file.FileDTO;
import com.chef.app.recipe.RecipeDTO;

public class MemberDTO extends FileDTO {
	private String member_id;
	private String member_name;
	private String member_mail;
	private String member_pwd;
	private String member_phone;
	private String member_nickname;
	private Long member_lev;
	private Date join_date;
	
	private String profile_about_me;
	private String profile_sns_url;
	private Long profile_hit;
	
	private String member_type;
	private String kakao_profile_img;
	
	private String profile_name;
	
	private List<RecipeDTO> recipedtos;
	
	private String resign;
	
	public String getResign() {
		return resign;
	}
	public void setResign(String resign) {
		this.resign = resign;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public List<RecipeDTO> getRecipedtos() {
		return recipedtos;
	}
	public void setRecipedtos(List<RecipeDTO> recipedtos) {
		this.recipedtos = recipedtos;
	}
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}

	public String getKakao_profile_img() {
		return kakao_profile_img;
	}
	public void setKakao_profile_img(String kakao_profile_img) {
		this.kakao_profile_img = kakao_profile_img;
	}
	public String getProfile_name() {
		return profile_name;
	}
	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
	}
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
	public String getMember_mail() {
		return member_mail;
	}
	public void setMember_mail(String membere_mail) {
		this.member_mail = membere_mail;

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




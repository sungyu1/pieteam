package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class Member {

	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String gender;
	private String age;
}

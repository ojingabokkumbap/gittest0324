package com.spring.javawspring.vo;

import lombok.Data;

@Data
	public class PayMentVO {
		private String name;						// 주문 물품명
		private int amount;							// 주문 금액
		private String buyer_email;			// 주문자 이메일주소
		private String buyer_name;			// 주문자성명
		private String buyer_tel;				// 전화번호
		private String buyer_addr;			// 주소
		private String buyer_postcode;	// 우편번호
		
		private String imp_uid;				// 고유ID
		private String merchant_uid;	// 상점 거래 ID
		private String paid_amount;		// 결제 금액
		private String apply_num;			// 카드 승인번호
	}

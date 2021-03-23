package com.phonemall.service;

import java.net.URI;

import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.phonemall.domain.KakaoPayPurchaseVO;
import com.phonemall.domain.KakaoPayReadyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class KakaoPayServiceImpl implements KakaoPayService {

	private static final String HOST = "https://kapi.kakao.com";

	@Override
	public String kakaoPayReady(KakaoPayPurchaseVO kakao) {

		log.info("kakao :  " + kakao);
		
		// RestTemplate: REST API 호출하고 응답을 받을 때까지 기다리는 동기방식의 spring inner class
		RestTemplate restTemplate = new RestTemplate();

        // Requested Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "f8a72916ce6595e1a043ae2d75a64669");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // Requested Body
        // RequestBody use MultiValueMap instead of HashMap to transmit
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME"); // Teat CID(가맹점 코드) Provided by Kakao
        params.add("partner_order_id", String.valueOf(kakao.getPurchase_id()));
        params.add("partner_user_id", kakao.getUser_email());
        params.add("item_name", kakao.getPurchase_name());
        params.add("quantity", String.valueOf(kakao.getPurchase_qty()));
        if(kakao.getPurchase_price()>1000000) {
        	params.add("total_amount", "1000000");
        }else {
        	params.add("total_amount", String.valueOf(kakao.getPurchase_price()));
        }
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8080/purchase/orderComplete?purchase_id="+kakao.getPurchase_id());
        params.add("cancel_url", "http://localhost:8080/kakaoPay/kakaoPayCancel?purchaseId="+kakao.getPurchase_id());
        params.add("fail_url", "http://localhost:8080/kakaoPay/kakaoPayFail?purchaseId="+kakao.getPurchase_id());

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
        	// Use RestTemplate to send data to kakaoPay
        	KakaoPayReadyVO kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);

            log.info("kakaoPay " + kakaoPayReadyVO);

            return kakaoPayReadyVO.getNext_redirect_pc_url();

        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        return "/pay";
	}


}
package com.nrifintech.bms.service;

import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.nrifintech.bms.entity.User;
import com.nrifintech.bms.repository.UserRepository;
import com.nrifintech.bms.util.AdminPrivileges;

@Service
public class UserService {
	@Autowired
	public UserRepository userRepo;

	public User findUser(String email) {
		User user = userRepo.findByEmail(email);
		if ((user != null) && (AdminPrivileges.NO.equals(user.getAdminPrivileges()))) {
			return user;
		}
		return null;
	}

	public boolean isValidUser(User user, String password) {
		String userPassword = decrypt(user.getPassword());
		if (userPassword.equals(password)) {
			return true;
		}
		return false;
	}

	public boolean isValidAdmin(User user, String password) {
		String userPassword = decrypt(user.getPassword());
		if (userPassword.equals(password)) {
			return true;
		}
		return false;
	}

	public void save(User user) {

		// set email to lowercase and save
		String email = user.getEmail().toLowerCase();
		// System.out.println(email);
		user.setEmail(email);
		userRepo.save(user);
	}

	public User findByMobileNo(String mobileNo) {
		return userRepo.findByMobileNo(mobileNo);
	}

	public User findAdmin(String email) {
		User user = userRepo.findByEmail(email);
		if ((user != null) && (AdminPrivileges.YES.equals(user.getAdminPrivileges()))) {
			return user;
		}
		return null;
	}

	public User getById(Integer id) {
		return userRepo.getById(id);
	}

	public String encrypt(String originalString) {

		Encoder encoder = Base64.getEncoder();
		String encodedString = encoder.encodeToString(originalString.getBytes());
		return encodedString;
	}

	public String decrypt(String originalString) {
		Decoder decoder = Base64.getDecoder();
		byte[] bytes = decoder.decode(originalString);
		String decoded = new String(bytes);
		return decoded;

	}

	public long countUsers() {
		return userRepo.count();
	}

	public void updateUser(String name, String mobile, int userid) {
		userRepo.updateUser(name, mobile, userid);
	}
}

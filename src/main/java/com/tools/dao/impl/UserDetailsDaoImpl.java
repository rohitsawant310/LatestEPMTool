package com.tools.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tools.beans.UserDetails;
import com.tools.dao.UserDetailsDao;
import com.tools.mapper.UserDetailsRowMapper;

@Service
public class UserDetailsDaoImpl implements UserDetailsDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Transactional
	@Override
	public UserDetails getUserDetails(String userId) {
		UserDetails userDetails = (UserDetails) jdbcTemplate.queryForObject(
				"SELECT * FROM USER_DETAILS WHERE USERID = ?", new Object[] { userId }, new UserDetailsRowMapper());
		System.out.println("userDetails:---"+userDetails);
		return userDetails;
	}

	@Transactional
	@Override
	public List<UserDetails> getAllUserDetails() {
		List<UserDetails> allUserDetails = (List<UserDetails>) jdbcTemplate.query("select * from USER_DETAILS",
				new UserDetailsRowMapper());
		return allUserDetails;
	}

	@Transactional
	@Override
	public int addUserDetails(UserDetails userDetails) {

		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(userDetails.getPassword());
		
		SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(jdbcTemplate);
		simpleJdbcInsert.withTableName("USER_DETAILS").usingGeneratedKeyColumns("id");

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("USERID", userDetails.getUserId());
		parameters.put("FIRST_NAME", userDetails.getFirstName());
		parameters.put("LAST_NAME", userDetails.getLastName());
		parameters.put("EMAILID", userDetails.getEmailId());
		parameters.put("PASSWORD", hashedPassword);
		parameters.put("ENABLED", "Y");
		parameters.put("DESIGNATION", userDetails.getDesignation());
		parameters.put("ORGANIZATION", userDetails.getOrganization());
		parameters.put("DOB", userDetails.getDateOfBirth());
		parameters.put("ADDRESS", userDetails.getAddress());
		parameters.put("AGE", userDetails.getAge());
		parameters.put("USERGROUP", userDetails.getUserGroup());

		Number insertedId = simpleJdbcInsert.executeAndReturnKey(parameters);
		return insertedId.intValue();
	}

	@Transactional
	@Override
	public int updateUserDetails(UserDetails userDetails) {
		String sql = "UPDATE USER_DETAILS SET FIRST_NAME = ?, LAST_NAME = ?, EMAILID = ?, PASSWORD = ?,ENABLED = ?,DESIGNATION= ?, ORGANIZATION = ?, DOB =?,  ADDRESS= ?, AGE =? WHERE USERID = ?";
		int resp = jdbcTemplate.update(sql,
				new Object[] { userDetails.getFirstName(), userDetails.getLastName(), userDetails.getEmailId(),
						userDetails.getPassword(), userDetails.getEnabled(), userDetails.getDesignation(),
						userDetails.getOrganization(), userDetails.getDateOfBirth(), userDetails.getAddress(),
						userDetails.getAge(), userDetails.getUserId() });
		return resp;
	}

	@Transactional
	@Override
	public int deleteUserDetails(String id) {
		int resp = jdbcTemplate.update("DELETE FROM USER_DETAILS where USERID = ?", id);
		return resp;
	}

	@Override
	public UserDetails getUserDetailsbyFirstName(String firstName) {
		UserDetails userDetails = (UserDetails) jdbcTemplate.queryForObject(
				"SELECT * FROM USER_DETAILS where FIRST_NAME = ?", new Object[] { firstName }, new UserDetailsRowMapper());
		return userDetails;
	}

	@Override
	public UserDetails getUserDetailsbyOrganization(String orgName) {
		UserDetails userDetails = (UserDetails) jdbcTemplate.queryForObject(
				"SELECT * FROM USER_DETAILS where ORGANIZATION = ?", new Object[] { orgName }, new UserDetailsRowMapper());
		return userDetails;
	}
}

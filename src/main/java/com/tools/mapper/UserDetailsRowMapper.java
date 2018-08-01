package com.tools.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;

import com.tools.beans.UserDetails;

public class UserDetailsRowMapper implements RowMapper<UserDetails> {

	@Override
	public UserDetails mapRow(ResultSet rs, int row) throws SQLException {
		
		UserDetails userDetails = new UserDetails();
		userDetails.setUserId(rs.getString("USERID"));
		userDetails.setFirstName(rs.getString("FIRST_NAME"));
		userDetails.setLastName(rs.getString("LAST_NAME"));
		userDetails.setEmailId(rs.getString("EMAILID"));
		userDetails.setPassword(rs.getString("PASSWORD"));
		userDetails.setEnabled(rs.getString("ENABLED"));
		userDetails.setDesignation(rs.getString("DESIGNATION"));
		userDetails.setOrganization(rs.getString("ORGANIZATION"));
		userDetails.setDateOfBirth(rs.getDate("DOB"));
		userDetails.setAddress(rs.getString("ADDRESS"));
		userDetails.setAge(rs.getInt("AGE"));
		userDetails.setUserGroup(rs.getString("USERGROUP"));
		
		return userDetails;
	}

}

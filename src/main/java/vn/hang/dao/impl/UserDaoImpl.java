package vn.hang.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.hang.configs.DBConnectMySQL;
import vn.hang.dao.IUserDao;
import vn.hang.models.UserModel;

public class UserDaoImpl extends DBConnectMySQL implements IUserDao {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	@Override
	public List<UserModel> findAll() {
		String sql = "select * from users";
		
		List<UserModel> list = new ArrayList<>(); // Tao list truyen du lieu
		
		try {
			conn = super.getDatabaseConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) /*den tung dong cuoi bang */{
				list.add(new UserModel(
						rs.getInt("id"),
						rs.getString("username"),
						rs.getString("password"),
						rs.getString("email"),
						rs.getString("fullname"),
						rs.getString("images")));
				
			}; //add vao
			return list;
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public UserModel findByid(int id) {
String sql = "select * from users where users.id = ?";
		
		try {
			conn = super.getDatabaseConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return new UserModel(
						rs.getInt("id"),
						rs.getString("username"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getString("fullname"),
						rs.getString("images"));
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public void insert(UserModel user) {
		String sql = "INSERT INTO users(id,username,email,password,images,fullname) VALUES (?,?,?,?,?,?)";
		try {
		conn = super.getDatabaseConnection();
		ps = conn.prepareStatement(sql);
		
		ps.setInt(1, user.getId());
		ps.setString(2, user.getUsername());
		ps.setString(3, user.getEmail());
		ps.setString(4, user.getPassword());
		ps.setString(5, user.getImages());
		ps.setString(6, user.getFullname());
		
		ps.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	 

	@Override
	public UserModel findByUsername(String username) {
		
		return null;
	}

	@Override
	public UserModel login(String username, String password) {
		UserModel user = this.findByUsername(username);
		if(user != null && password.equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	@Override
	public boolean register(String username, String email, String password, String fullname, String images) {
		if(this.checkExistUsername(username) || this.checkExistEmail(email))
			return false;
		this.insert(new UserModel( username, email, password, fullname, images));
		return true;
	}
	

	@Override
	public boolean checkExistUsername(String username) {
	String sql = "select * from users where username = ?";
			
			try {
				conn = super.getDatabaseConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, username);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					return true;
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		
	}

	@Override
	public boolean checkExistEmail(String email) {
String sql = "select * from users where email = ?";
		
		try {
			conn = super.getDatabaseConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}



public static void main(String[] args) {
	UserDaoImpl userDao = new UserDaoImpl();
	//Insert
	userDao.insert(new UserModel(2,"abc1","abc@gmal.com","123","","abce"));
	//Find All
	List<UserModel> list = userDao.findAll();
	
	for(UserModel user : list) {
		System.out.println(user);
		}
	//find Id
	System.out.println(userDao.findByid(1));
//	LOGIN
	System.out.println(userDao.login("abcd", "123"));
	System.out.println(userDao.login("hello1", "123"));
//	REGISTER
	System.out.println(userDao.register("abc1", "abcd@gmail.com", "123", "ABC1", ""));
	System.out.println(userDao.register("abc2", "abc@gmail.com", "123", "ABC2", ""));
	System.out.println(userDao.register("abc3", "abcd@gmail.com", "123", "ABC3", ""));
	}
}

package com.zydc.ssm.module.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.zydc.ssm.module.user.Util.DbUtil;
import com.zydc.ssm.module.user.pojo.DataDictionary;
import com.zydc.ssm.module.user.pojo.DictionaryName;

public class DictionaryDataDao {

    private Connection connection;

    public DictionaryDataDao() {
        connection = DbUtil.getConnection();
    }

    /*
    public void addUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into users(firstname,lastname,dob,email) values (?, ?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from users where userid=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update users set firstname=?, lastname=?, dob=?, email=?" +
                            "where userid=?");
            // Parameters start with 1
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setInt(5, user.getUserid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int userId) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from users where userid=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user.setUserid(rs.getInt("userid"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    */
    public List<DataDictionary> getAllData() {
        List<DataDictionary> dataList = new ArrayList<DataDictionary>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from z_data_dictionary order by Content_Order desc");

            while (rs.next()) {
                DataDictionary data = new DataDictionary();
                data.setDictionaryNameId(rs.getInt("Dictionary_Name_ID"));
                data.setDictionaryContent(rs.getString("Dictionary_Content"));
                dataList.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dataList;
    }

    public DictionaryName getDictionNameById(int id) {
        DictionaryName dName = new DictionaryName();
        try {
            Statement statement = connection.createStatement();
            String sql = "select * from z_dictionary_name where Dictionary_Name_ID =" + Integer.toString(id);
            ResultSet rs = statement.executeQuery(sql);
            rs.next();
            dName.setDictionaryName(rs.getString("Dictionary_Name"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dName;
    }
}
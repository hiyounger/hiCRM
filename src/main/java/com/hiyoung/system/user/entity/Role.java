package com.hiyoung.system.user.entity;

import java.util.Date;
import java.util.List;

public class Role {
    private Integer id;

    private Date createtime;

    private String rolename;

    private String rolenote;

    private Integer sortnum;

    private Integer status;

    private Date updatetime;

    private Integer createby;

    private Integer updateby;



    public Role() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public String getRolenote() {
        return rolenote;
    }

    public void setRolenote(String rolenote) {
        this.rolenote = rolenote == null ? null : rolenote.trim();
    }

    public Integer getSortnum() {
        return sortnum;
    }

    public void setSortnum(Integer sortnum) {
        this.sortnum = sortnum;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getCreateby() {
        return createby;
    }

    public void setCreateby(Integer createby) {
        this.createby = createby;
    }

    public Integer getUpdateby() {
        return updateby;
    }

    public void setUpdateby(Integer updateby) {
        this.updateby = updateby;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", createtime=" + createtime +
                ", rolename='" + rolename + '\'' +
                ", rolenote='" + rolenote + '\'' +
                ", sortnum=" + sortnum +
                ", status=" + status +
                ", updatetime=" + updatetime +
                ", createby=" + createby +
                ", updateby=" + updateby +
                '}';
    }


}
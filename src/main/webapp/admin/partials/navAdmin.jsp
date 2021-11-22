<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/22/21
  Time: 5:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav id="navbar-main" class="navbar is-fixed-top">
    <div class="navbar-brand">
        <a class="navbar-item is-hidden-desktop jb-aside-mobile-toggle">
            <span class="icon"><i class="mdi mdi-forwardburger mdi-24px"></i></span>
        </a>
        <div class="navbar-item has-control">
            <div class="control"><input placeholder="Search everywhere..." class="input"></div>
        </div>
    </div>
    <div class="navbar-brand is-right">
        <a class="navbar-item is-hidden-desktop jb-navbar-menu-toggle" data-target="navbar-menu">
            <span class="icon"><i class="mdi mdi-dots-vertical"></i></span>
        </a>
    </div>
    <div class="navbar-menu fadeIn animated faster" id="navbar-menu">
        <div class="navbar-end">
            <div class="navbar-item has-dropdown has-dropdown-with-icons has-divider is-hoverable">
                <a class="navbar-link is-arrowless">
                    <span class="icon"><i class="mdi mdi-menu"></i></span>
                    <span>Menu</span>
                    <span class="icon">
            <i class="mdi mdi-chevron-down"></i>
          </span>
                </a>
                <div class="navbar-dropdown">
                    <a href="/user/admin/profile" class="navbar-item">
                        <span class="icon"><i class="mdi mdi-account"></i></span>
                        <span>My Profile</span>
                    </a>
                    <a class="navbar-item">
                        <span class="icon"><i class="mdi mdi-settings"></i></span>
                        <span>Settings</span>
                    </a>
                    <a class="navbar-item">
                        <span class="icon"><i class="mdi mdi-email"></i></span>
                        <span>Messages</span>
                    </a>
                    <hr class="navbar-divider">
                    <a class="navbar-item">
                        <span class="icon"><i class="mdi mdi-logout"></i></span>
                        <span>Log Out</span>
                    </a>
                </div>
            </div>
            <div class="navbar-item has-dropdown has-dropdown-with-icons has-divider has-user-avatar is-hoverable">
                <a class="navbar-link is-arrowless">
                    <div class="is-user-avatar">
                        <img src="https://avatars.dicebear.com/v2/initials/john-doe.svg" alt="John Doe">
                    </div>
                    <div class="is-user-name"><span> <%= session.getAttribute("username")%></span></div>
                    <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
                </a>
                <div class="navbar-dropdown">
                    <a href="/user/admin/profile" class="navbar-item">
                        <span class="icon"><i class="mdi mdi-account"></i></span>
                        <span>My Profile</span>
                    </a>
                    <a class="navbar-item">
                        <span class="icon"><i class="mdi mdi-settings"></i></span>
                        <span>Settings</span>
                    </a>
                    <a class="navbar-item">
                        <span class="icon"><i class="mdi mdi-email"></i></span>
                        <span>Messages</span>
                    </a>
                    <hr class="navbar-divider">
                    <a class="navbar-item" href="/logout">
                        <span class="icon"><i class="mdi mdi-logout"></i></span>
                        <span>Log Out</span>
                    </a>
                </div>
            </div>
            <a href="/about" title="About" class="navbar-item has-divider is-desktop-icon-only" >
                <span class="icon"><i class="mdi mdi-help-circle-outline"></i></span>
                <span>About</span>
            </a>
            <a title="Log out" class="navbar-item is-desktop-icon-only" href="/logout">
                <span class="icon"><i class="mdi mdi-logout"></i></span>
                <span>Log out</span>
            </a>
        </div>
    </div>
</nav>
<%--
  Created by IntelliJ IDEA.
  User: dasith
  Date: 11/22/21
  Time: 5:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="aside is-placed-left is-expanded">
  <div class="aside-tools">
    <div class="aside-tools-label">
      <span><b>Admin</b> Dashboard</span>
    </div>
  </div>

  <div class="menu is-menu-main">
    <p class="menu-label">General</p>
    <ul class="menu-list">
      <li>
        <a href="/user/admin" class="is-active router-link-active has-icon">
          <span class="icon"><i class="mdi mdi-desktop-mac"></i></span>
          <span class="menu-item-label">Dashboard</span>
        </a>
      </li>
    </ul>
    <p class="menu-label">Examples</p>
    <ul class="menu-list">
      <li>
        <a href="tables.html" class="has-icon">
          <span class="icon has-update-mark"><i class="mdi mdi-table"></i></span>
          <span class="menu-item-label">Tables</span>
        </a>
      </li>
      <li>
        <a href="forms.html" class="has-icon">
          <span class="icon"><i class="mdi mdi-square-edit-outline"></i></span>
          <span class="menu-item-label">Forms</span>
        </a>
      </li>
      <li>
        <a href="profile.html" class="has-icon">
          <span class="icon"><i class="mdi mdi-account-circle"></i></span>
          <span class="menu-item-label">Profile</span>
        </a>
      </li>
      <li>
        <a class="has-icon has-dropdown-icon">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">Submenus</span>
          <div class="dropdown-icon">
            <span class="icon"><i class="mdi mdi-plus"></i></span>
          </div>
        </a>
        <ul>
          <li>
            <a href="#void">
              <span>Sub-item One</span>
            </a>
          </li>
          <li>
            <a href="#void">
              <span>Sub-item Two</span>
            </a>
          </li>
        </ul>
      </li>
    </ul>
    <p class="menu-label">About</p>
    <ul class="menu-list">
      <li>
        <a href="https://admin-one-html.justboil.me/" target="_blank" class="has-icon">
          <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
          <span class="menu-item-label">Premium Demo</span>
        </a>
      </li>
      <li>
        <a href="https://justboil.me/bulma-admin-template/one-html" class="has-icon">
          <span class="icon"><i class="mdi mdi-help-circle"></i></span>
          <span class="menu-item-label">About</span>
        </a>
      </li>
    </ul>
  </div>
</aside>

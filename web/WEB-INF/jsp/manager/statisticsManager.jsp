<%--
  Created by IntelliJ IDEA.
  User: 최예슬
  Date: 2021-06-01
  Time: 오후 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String orderInfo = (String) request.getAttribute("orderInfo");
%>
<html lang="en"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">

    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    <style type="text/css">.apexcharts-canvas {
        position: relative;
        user-select: none;
        /* cannot give overflow: hidden as it will crop tooltips which overflow outside chart area */
    }


    /* scrollbar is not visible by default for legend, hence forcing the visibility */
    .apexcharts-canvas ::-webkit-scrollbar {
        -webkit-appearance: none;
        width: 6px;
    }

    .apexcharts-canvas ::-webkit-scrollbar-thumb {
        border-radius: 4px;
        background-color: rgba(0, 0, 0, .5);
        box-shadow: 0 0 1px rgba(255, 255, 255, .5);
        -webkit-box-shadow: 0 0 1px rgba(255, 255, 255, .5);
    }


    .apexcharts-inner {
        position: relative;
    }

    .apexcharts-text tspan {
        font-family: inherit;
    }

    .legend-mouseover-inactive {
        transition: 0.15s ease all;
        opacity: 0.20;
    }

    .apexcharts-series-collapsed {
        opacity: 0;
    }

    .apexcharts-tooltip {
        border-radius: 5px;
        box-shadow: 2px 2px 6px -4px #999;
        cursor: default;
        font-size: 14px;
        left: 62px;
        opacity: 0;
        pointer-events: none;
        position: absolute;
        top: 20px;
        display: flex;
        flex-direction: column;
        overflow: hidden;
        white-space: nowrap;
        z-index: 12;
        transition: 0.15s ease all;
    }

    .apexcharts-tooltip.apexcharts-active {
        opacity: 1;
        transition: 0.15s ease all;
    }

    .apexcharts-tooltip.apexcharts-theme-light {
        border: 1px solid #e3e3e3;
        background: rgba(255, 255, 255, 0.96);
    }

    .apexcharts-tooltip.apexcharts-theme-dark {
        color: #fff;
        background: rgba(30, 30, 30, 0.8);
    }

    .apexcharts-tooltip * {
        font-family: inherit;
    }


    .apexcharts-tooltip-title {
        padding: 6px;
        font-size: 15px;
        margin-bottom: 4px;
    }

    .apexcharts-tooltip.apexcharts-theme-light .apexcharts-tooltip-title {
        background: #ECEFF1;
        border-bottom: 1px solid #ddd;
    }

    .apexcharts-tooltip.apexcharts-theme-dark .apexcharts-tooltip-title {
        background: rgba(0, 0, 0, 0.7);
        border-bottom: 1px solid #333;
    }

    .apexcharts-tooltip-text-value,
    .apexcharts-tooltip-text-z-value {
        display: inline-block;
        font-weight: 600;
        margin-left: 5px;
    }

    .apexcharts-tooltip-text-z-label:empty,
    .apexcharts-tooltip-text-z-value:empty {
        display: none;
    }

    .apexcharts-tooltip-text-value,
    .apexcharts-tooltip-text-z-value {
        font-weight: 600;
    }

    .apexcharts-tooltip-marker {
        width: 12px;
        height: 12px;
        position: relative;
        top: 0px;
        margin-right: 10px;
        border-radius: 50%;
    }

    .apexcharts-tooltip-series-group {
        padding: 0 10px;
        display: none;
        text-align: left;
        justify-content: left;
        align-items: center;
    }

    .apexcharts-tooltip-series-group.apexcharts-active .apexcharts-tooltip-marker {
        opacity: 1;
    }

    .apexcharts-tooltip-series-group.apexcharts-active,
    .apexcharts-tooltip-series-group:last-child {
        padding-bottom: 4px;
    }

    .apexcharts-tooltip-series-group-hidden {
        opacity: 0;
        height: 0;
        line-height: 0;
        padding: 0 !important;
    }

    .apexcharts-tooltip-y-group {
        padding: 6px 0 5px;
    }

    .apexcharts-tooltip-candlestick {
        padding: 4px 8px;
    }

    .apexcharts-tooltip-candlestick>div {
        margin: 4px 0;
    }

    .apexcharts-tooltip-candlestick span.value {
        font-weight: bold;
    }

    .apexcharts-tooltip-rangebar {
        padding: 5px 8px;
    }

    .apexcharts-tooltip-rangebar .category {
        font-weight: 600;
        color: #777;
    }

    .apexcharts-tooltip-rangebar .series-name {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }

    .apexcharts-xaxistooltip {
        opacity: 0;
        padding: 9px 10px;
        pointer-events: none;
        color: #373d3f;
        font-size: 13px;
        text-align: center;
        border-radius: 2px;
        position: absolute;
        z-index: 10;
        background: #ECEFF1;
        border: 1px solid #90A4AE;
        transition: 0.15s ease all;
    }

    .apexcharts-xaxistooltip.apexcharts-theme-dark {
        background: rgba(0, 0, 0, 0.7);
        border: 1px solid rgba(0, 0, 0, 0.5);
        color: #fff;
    }

    .apexcharts-xaxistooltip:after,
    .apexcharts-xaxistooltip:before {
        left: 50%;
        border: solid transparent;
        content: " ";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }

    .apexcharts-xaxistooltip:after {
        border-color: rgba(236, 239, 241, 0);
        border-width: 6px;
        margin-left: -6px;
    }

    .apexcharts-xaxistooltip:before {
        border-color: rgba(144, 164, 174, 0);
        border-width: 7px;
        margin-left: -7px;
    }

    .apexcharts-xaxistooltip-bottom:after,
    .apexcharts-xaxistooltip-bottom:before {
        bottom: 100%;
    }

    .apexcharts-xaxistooltip-top:after,
    .apexcharts-xaxistooltip-top:before {
        top: 100%;
    }

    .apexcharts-xaxistooltip-bottom:after {
        border-bottom-color: #ECEFF1;
    }

    .apexcharts-xaxistooltip-bottom:before {
        border-bottom-color: #90A4AE;
    }

    .apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:after {
        border-bottom-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-xaxistooltip-bottom.apexcharts-theme-dark:before {
        border-bottom-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-xaxistooltip-top:after {
        border-top-color: #ECEFF1
    }

    .apexcharts-xaxistooltip-top:before {
        border-top-color: #90A4AE;
    }

    .apexcharts-xaxistooltip-top.apexcharts-theme-dark:after {
        border-top-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-xaxistooltip-top.apexcharts-theme-dark:before {
        border-top-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-xaxistooltip.apexcharts-active {
        opacity: 1;
        transition: 0.15s ease all;
    }

    .apexcharts-yaxistooltip {
        opacity: 0;
        padding: 4px 10px;
        pointer-events: none;
        color: #373d3f;
        font-size: 13px;
        text-align: center;
        border-radius: 2px;
        position: absolute;
        z-index: 10;
        background: #ECEFF1;
        border: 1px solid #90A4AE;
    }

    .apexcharts-yaxistooltip.apexcharts-theme-dark {
        background: rgba(0, 0, 0, 0.7);
        border: 1px solid rgba(0, 0, 0, 0.5);
        color: #fff;
    }

    .apexcharts-yaxistooltip:after,
    .apexcharts-yaxistooltip:before {
        top: 50%;
        border: solid transparent;
        content: " ";
        height: 0;
        width: 0;
        position: absolute;
        pointer-events: none;
    }

    .apexcharts-yaxistooltip:after {
        border-color: rgba(236, 239, 241, 0);
        border-width: 6px;
        margin-top: -6px;
    }

    .apexcharts-yaxistooltip:before {
        border-color: rgba(144, 164, 174, 0);
        border-width: 7px;
        margin-top: -7px;
    }

    .apexcharts-yaxistooltip-left:after,
    .apexcharts-yaxistooltip-left:before {
        left: 100%;
    }

    .apexcharts-yaxistooltip-right:after,
    .apexcharts-yaxistooltip-right:before {
        right: 100%;
    }

    .apexcharts-yaxistooltip-left:after {
        border-left-color: #ECEFF1;
    }

    .apexcharts-yaxistooltip-left:before {
        border-left-color: #90A4AE;
    }

    .apexcharts-yaxistooltip-left.apexcharts-theme-dark:after {
        border-left-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-yaxistooltip-left.apexcharts-theme-dark:before {
        border-left-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-yaxistooltip-right:after {
        border-right-color: #ECEFF1;
    }

    .apexcharts-yaxistooltip-right:before {
        border-right-color: #90A4AE;
    }

    .apexcharts-yaxistooltip-right.apexcharts-theme-dark:after {
        border-right-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-yaxistooltip-right.apexcharts-theme-dark:before {
        border-right-color: rgba(0, 0, 0, 0.5);
    }

    .apexcharts-yaxistooltip.apexcharts-active {
        opacity: 1;
    }

    .apexcharts-yaxistooltip-hidden {
        display: none;
    }

    .apexcharts-xcrosshairs,
    .apexcharts-ycrosshairs {
        pointer-events: none;
        opacity: 0;
        transition: 0.15s ease all;
    }

    .apexcharts-xcrosshairs.apexcharts-active,
    .apexcharts-ycrosshairs.apexcharts-active {
        opacity: 1;
        transition: 0.15s ease all;
    }

    .apexcharts-ycrosshairs-hidden {
        opacity: 0;
    }

    .apexcharts-selection-rect {
        cursor: move;
    }

    .svg_select_boundingRect, .svg_select_points_rot {
        pointer-events: none;
        opacity: 0;
        visibility: hidden;
    }
    .apexcharts-selection-rect + g .svg_select_boundingRect,
    .apexcharts-selection-rect + g .svg_select_points_rot {
        opacity: 0;
        visibility: hidden;
    }

    .apexcharts-selection-rect + g .svg_select_points_l,
    .apexcharts-selection-rect + g .svg_select_points_r {
        cursor: ew-resize;
        opacity: 1;
        visibility: visible;
    }

    .svg_select_points {
        fill: #efefef;
        stroke: #333;
        rx: 2;
    }

    .apexcharts-svg.apexcharts-zoomable.hovering-zoom {
        cursor: crosshair
    }

    .apexcharts-svg.apexcharts-zoomable.hovering-pan {
        cursor: move
    }

    .apexcharts-zoom-icon,
    .apexcharts-zoomin-icon,
    .apexcharts-zoomout-icon,
    .apexcharts-reset-icon,
    .apexcharts-pan-icon,
    .apexcharts-selection-icon,
    .apexcharts-menu-icon,
    .apexcharts-toolbar-custom-icon {
        cursor: pointer;
        width: 20px;
        height: 20px;
        line-height: 24px;
        color: #6E8192;
        text-align: center;
    }

    .apexcharts-zoom-icon svg,
    .apexcharts-zoomin-icon svg,
    .apexcharts-zoomout-icon svg,
    .apexcharts-reset-icon svg,
    .apexcharts-menu-icon svg {
        fill: #6E8192;
    }

    .apexcharts-selection-icon svg {
        fill: #444;
        transform: scale(0.76)
    }

    .apexcharts-theme-dark .apexcharts-zoom-icon svg,
    .apexcharts-theme-dark .apexcharts-zoomin-icon svg,
    .apexcharts-theme-dark .apexcharts-zoomout-icon svg,
    .apexcharts-theme-dark .apexcharts-reset-icon svg,
    .apexcharts-theme-dark .apexcharts-pan-icon svg,
    .apexcharts-theme-dark .apexcharts-selection-icon svg,
    .apexcharts-theme-dark .apexcharts-menu-icon svg,
    .apexcharts-theme-dark .apexcharts-toolbar-custom-icon svg {
        fill: #f3f4f5;
    }

    .apexcharts-canvas .apexcharts-zoom-icon.apexcharts-selected svg,
    .apexcharts-canvas .apexcharts-selection-icon.apexcharts-selected svg,
    .apexcharts-canvas .apexcharts-reset-zoom-icon.apexcharts-selected svg {
        fill: #008FFB;
    }

    .apexcharts-theme-light .apexcharts-selection-icon:not(.apexcharts-selected):hover svg,
    .apexcharts-theme-light .apexcharts-zoom-icon:not(.apexcharts-selected):hover svg,
    .apexcharts-theme-light .apexcharts-zoomin-icon:hover svg,
    .apexcharts-theme-light .apexcharts-zoomout-icon:hover svg,
    .apexcharts-theme-light .apexcharts-reset-icon:hover svg,
    .apexcharts-theme-light .apexcharts-menu-icon:hover svg {
        fill: #333;
    }

    .apexcharts-selection-icon,
    .apexcharts-menu-icon {
        position: relative;
    }

    .apexcharts-reset-icon {
        margin-left: 5px;
    }

    .apexcharts-zoom-icon,
    .apexcharts-reset-icon,
    .apexcharts-menu-icon {
        transform: scale(0.85);
    }

    .apexcharts-zoomin-icon,
    .apexcharts-zoomout-icon {
        transform: scale(0.7)
    }

    .apexcharts-zoomout-icon {
        margin-right: 3px;
    }

    .apexcharts-pan-icon {
        transform: scale(0.62);
        position: relative;
        left: 1px;
        top: 0px;
    }

    .apexcharts-pan-icon svg {
        fill: #fff;
        stroke: #6E8192;
        stroke-width: 2;
    }

    .apexcharts-pan-icon.apexcharts-selected svg {
        stroke: #008FFB;
    }

    .apexcharts-pan-icon:not(.apexcharts-selected):hover svg {
        stroke: #333;
    }

    .apexcharts-toolbar {
        position: absolute;
        z-index: 11;
        max-width: 176px;
        text-align: right;
        border-radius: 3px;
        padding: 0px 6px 2px 6px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .apexcharts-menu {
        background: #fff;
        position: absolute;
        top: 100%;
        border: 1px solid #ddd;
        border-radius: 3px;
        padding: 3px;
        right: 10px;
        opacity: 0;
        min-width: 110px;
        transition: 0.15s ease all;
        pointer-events: none;
    }

    .apexcharts-menu.apexcharts-menu-open {
        opacity: 1;
        pointer-events: all;
        transition: 0.15s ease all;
    }

    .apexcharts-menu-item {
        padding: 6px 7px;
        font-size: 12px;
        cursor: pointer;
    }

    .apexcharts-theme-light .apexcharts-menu-item:hover {
        background: #eee;
    }

    .apexcharts-theme-dark .apexcharts-menu {
        background: rgba(0, 0, 0, 0.7);
        color: #fff;
    }

    @media screen and (min-width: 768px) {
        .apexcharts-canvas:hover .apexcharts-toolbar {
            opacity: 1;
        }
    }

    .apexcharts-datalabel.apexcharts-element-hidden {
        opacity: 0;
    }

    .apexcharts-pie-label,
    .apexcharts-datalabels,
    .apexcharts-datalabel,
    .apexcharts-datalabel-label,
    .apexcharts-datalabel-value {
        cursor: default;
        pointer-events: none;
    }

    .apexcharts-pie-label-delay {
        opacity: 0;
        animation-name: opaque;
        animation-duration: 0.3s;
        animation-fill-mode: forwards;
        animation-timing-function: ease;
    }

    .apexcharts-canvas .apexcharts-element-hidden {
        opacity: 0;
    }

    .apexcharts-hide .apexcharts-series-points {
        opacity: 0;
    }

    .apexcharts-gridline,
    .apexcharts-annotation-rect,
    .apexcharts-tooltip .apexcharts-marker,
    .apexcharts-area-series .apexcharts-area,
    .apexcharts-line,
    .apexcharts-zoom-rect,
    .apexcharts-toolbar svg,
    .apexcharts-area-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
    .apexcharts-line-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
    .apexcharts-radar-series path,
    .apexcharts-radar-series polygon {
        pointer-events: none;
    }


    /* markers */

    .apexcharts-marker {
        transition: 0.15s ease all;
    }

    @keyframes opaque {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }


    /* Resize generated styles */

    @keyframes resizeanim {
        from {
            opacity: 0;
        }
        to {
            opacity: 0;
        }
    }

    .resize-triggers {
        animation: 1ms resizeanim;
        visibility: hidden;
        opacity: 0;
    }

    .resize-triggers,
    .resize-triggers>div,
    .contract-trigger:before {
        content: " ";
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        overflow: hidden;
    }

    .resize-triggers>div {
        background: #eee;
        overflow: auto;
    }

    .contract-trigger:before {
        width: 200%;
        height: 200%;
    }</style></head>

<body>
<%@include file="../common/header.jsp" %>
<div id="app">
    <div id="sidebar" class="">
        <div class="sidebar-wrapper active ps ps--active-y">
            <div class="sidebar-header">
                <div class="d-flex justify-content-between">
                    <div class="logo">
                        <a href="index.html"><img src="assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                    </div>
                    <div class="toggler">
                        <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                    </div>
                </div>
            </div>
            <div class="sidebar-menu">
                <ul class="menu">
                    <li class="sidebar-title">Menu</li>

                    <li class="sidebar-item active ">
                        <a href="index.html" class="sidebar-link">
                            <i class="bi bi-grid-fill"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-stack"></i>
                            <span>Components</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="component-alert.html">Alert</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-badge.html">Badge</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-breadcrumb.html">Breadcrumb</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-button.html">Button</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-card.html">Card</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-carousel.html">Carousel</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-dropdown.html">Dropdown</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-list-group.html">List Group</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-modal.html">Modal</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-navs.html">Navs</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-pagination.html">Pagination</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-progress.html">Progress</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-spinner.html">Spinner</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="component-tooltip.html">Tooltip</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-collection-fill"></i>
                            <span>Extra Components</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="extra-component-avatar.html">Avatar</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="extra-component-sweetalert.html">Sweet Alert</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="extra-component-toastify.html">Toastify</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="extra-component-rating.html">Rating</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="extra-component-divider.html">Divider</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-grid-1x2-fill"></i>
                            <span>Layouts</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="layout-default.html">Default Layout</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="layout-vertical-1-column.html">1 Column</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="layout-vertical-navbar.html">Vertical with Navbar</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="layout-horizontal.html">Horizontal Menu</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-title">Forms &amp; Tables</li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-hexagon-fill"></i>
                            <span>Form Elements</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="form-element-input.html">Input</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-element-input-group.html">Input Group</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-element-select.html">Select</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-element-radio.html">Radio</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-element-checkbox.html">Checkbox</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-element-textarea.html">Textarea</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="form-layout.html" class="sidebar-link">
                            <i class="bi bi-file-earmark-medical-fill"></i>
                            <span>Form Layout</span>
                        </a>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-pen-fill"></i>
                            <span>Form Editor</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="form-editor-quill.html">Quill</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-editor-ckeditor.html">CKEditor</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-editor-summernote.html">Summernote</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="form-editor-tinymce.html">TinyMCE</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="table.html" class="sidebar-link">
                            <i class="bi bi-grid-1x2-fill"></i>
                            <span>Table</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="table-datatable.html" class="sidebar-link">
                            <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                            <span>Datatable</span>
                        </a>
                    </li>

                    <li class="sidebar-title">Extra UI</li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-pentagon-fill"></i>
                            <span>Widgets</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="ui-widgets-chatbox.html">Chatbox</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="ui-widgets-pricing.html">Pricing</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="ui-widgets-todolist.html">To-do List</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-egg-fill"></i>
                            <span>Icons</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="ui-icons-bootstrap-icons.html">Bootstrap Icons </a>
                            </li>
                            <li class="submenu-item ">
                                <a href="ui-icons-fontawesome.html">Fontawesome</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="ui-icons-dripicons.html">Dripicons</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-bar-chart-fill"></i>
                            <span>Charts</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="ui-chart-chartjs.html">ChartJS</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="ui-chart-apexcharts.html">Apexcharts</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="ui-file-uploader.html" class="sidebar-link">
                            <i class="bi bi-cloud-arrow-up-fill"></i>
                            <span>File Uploader</span>
                        </a>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-map-fill"></i>
                            <span>Maps</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="ui-map-google-map.html">Google Map</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="ui-map-jsvectormap.html">JS Vector Map</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-title">Pages</li>

                    <li class="sidebar-item  ">
                        <a href="application-email.html" class="sidebar-link">
                            <i class="bi bi-envelope-fill"></i>
                            <span>Email Application</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="application-chat.html" class="sidebar-link">
                            <i class="bi bi-chat-dots-fill"></i>
                            <span>Chat Application</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="application-gallery.html" class="sidebar-link">
                            <i class="bi bi-image-fill"></i>
                            <span>Photo Gallery</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="application-checkout.html" class="sidebar-link">
                            <i class="bi bi-basket-fill"></i>
                            <span>Checkout Page</span>
                        </a>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-person-badge-fill"></i>
                            <span>Authentication</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="auth-login.html">Login</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="auth-register.html">Register</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="auth-forgot-password.html">Forgot Password</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-item  has-sub">
                        <a href="#" class="sidebar-link">
                            <i class="bi bi-x-octagon-fill"></i>
                            <span>Errors</span>
                        </a>
                        <ul class="submenu ">
                            <li class="submenu-item ">
                                <a href="error-403.html">403</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="error-404.html">404</a>
                            </li>
                            <li class="submenu-item ">
                                <a href="error-500.html">500</a>
                            </li>
                        </ul>
                    </li>

                    <li class="sidebar-title">Raise Support</li>

                    <li class="sidebar-item  ">
                        <a href="https://zuramai.github.io/mazer/docs" class="sidebar-link">
                            <i class="bi bi-life-preserver"></i>
                            <span>Documentation</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="https://github.com/zuramai/mazer/blob/main/CONTRIBUTING.md" class="sidebar-link">
                            <i class="bi bi-puzzle"></i>
                            <span>Contribute</span>
                        </a>
                    </li>

                    <li class="sidebar-item  ">
                        <a href="https://github.com/zuramai/mazer#donate" class="sidebar-link">
                            <i class="bi bi-cash"></i>
                            <span>Donate</span>
                        </a>
                    </li>

                </ul>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; height: 610px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 225px;"></div></div></div>
    </div>
    <div id="main">
        <header class="mb-3">
            <a href="#" class="burger-btn d-block d-xl-none">
                <i class="bi bi-justify fs-3"></i>
            </a>
        </header>

        <div class="page-heading">
            <h3>Profile Statistics</h3>
        </div>
        <div class="page-content">
            <section class="row">
                <div class="col-12 col-lg-9">
                    <div class="row">
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-3 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="stats-icon purple">
                                                <i class="iconly-boldShow"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <h6 class="text-muted font-semibold">Profile Views</h6>
                                            <h6 class="font-extrabold mb-0">112.000</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-3 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="stats-icon blue">
                                                <i class="iconly-boldProfile"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <h6 class="text-muted font-semibold">Followers</h6>
                                            <h6 class="font-extrabold mb-0">183.000</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-3 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="stats-icon green">
                                                <i class="iconly-boldAdd-User"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <h6 class="text-muted font-semibold">Following</h6>
                                            <h6 class="font-extrabold mb-0">80.000</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-3 py-4-5">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="stats-icon red">
                                                <i class="iconly-boldBookmark"></i>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <h6 class="text-muted font-semibold">Saved Post</h6>
                                            <h6 class="font-extrabold mb-0">112</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Profile Visit</h4>
                                </div>
                                <div class="card-body" style="position: relative;">
                                    <div id="chart-profile-visit" style="min-height: 315px;"><div id="apexchartsht7i9f27h" class="apexcharts-canvas apexchartsht7i9f27h apexcharts-theme-light" style="width: 93px; height: 300px;"><svg id="SvgjsSvg1983" width="93" height="300" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1985" class="apexcharts-inner apexcharts-graphical" transform="translate(39.25, 30)"><defs id="SvgjsDefs1984"><linearGradient id="SvgjsLinearGradient1990" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1991" stop-opacity="0.4" stop-color="rgba(216,227,240,0.4)" offset="0"></stop><stop id="SvgjsStop1992" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop><stop id="SvgjsStop1993" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop></linearGradient><clipPath id="gridRectMaskht7i9f27h"><rect id="SvgjsRect1995" width="47.75" height="221.0302595876058" x="-2" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMaskht7i9f27h"><rect id="SvgjsRect1996" width="47.75" height="225.0302595876058" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs><rect id="SvgjsRect1994" width="2.5520833333333335" height="221.0302595876058" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke-dasharray="3" fill="url(#SvgjsLinearGradient1990)" class="apexcharts-xcrosshairs" y2="221.0302595876058" filter="none" fill-opacity="0.9"></rect><g id="SvgjsG2012" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG2013" class="apexcharts-xaxis-texts-g" transform="translate(0, -10)"><text id="SvgjsText2015" font-family="Helvetica, Arial, sans-serif" x="1.8229166666666667" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 2.8203125 239.03125)"><tspan id="SvgjsTspan2016">Jan</tspan><title>Jan</title></text><text id="SvgjsText2018" font-family="Helvetica, Arial, sans-serif" x="5.46875" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 1 -1)"><tspan id="SvgjsTspan2019"></tspan><title></title></text><text id="SvgjsText2021" font-family="Helvetica, Arial, sans-serif" x="9.114583333333334" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 10.453125 239.03125)"><tspan id="SvgjsTspan2022">Mar</tspan><title>Mar</title></text><text id="SvgjsText2024" font-family="Helvetica, Arial, sans-serif" x="12.760416666666668" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 1 -1)"><tspan id="SvgjsTspan2025"></tspan><title></title></text><text id="SvgjsText2027" font-family="Helvetica, Arial, sans-serif" x="16.40625" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 17.7421875 239.03125)"><tspan id="SvgjsTspan2028">May</tspan><title>May</title></text><text id="SvgjsText2030" font-family="Helvetica, Arial, sans-serif" x="20.052083333333332" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 1 -1)"><tspan id="SvgjsTspan2031"></tspan><title></title></text><text id="SvgjsText2033" font-family="Helvetica, Arial, sans-serif" x="23.697916666666664" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 24.6953125 239.03125)"><tspan id="SvgjsTspan2034">Jul</tspan><title>Jul</title></text><text id="SvgjsText2036" font-family="Helvetica, Arial, sans-serif" x="27.343749999999996" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 1 -1)"><tspan id="SvgjsTspan2037"></tspan><title></title></text><text id="SvgjsText2039" font-family="Helvetica, Arial, sans-serif" x="30.989583333333332" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 31.9921875 239.03125)"><tspan id="SvgjsTspan2040">Sep</tspan><title>Sep</title></text><text id="SvgjsText2042" font-family="Helvetica, Arial, sans-serif" x="34.63541666666667" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 1 -1)"><tspan id="SvgjsTspan2043"></tspan><title></title></text><text id="SvgjsText2045" font-family="Helvetica, Arial, sans-serif" x="38.28125000000001" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 39.6171875 239.03125)"><tspan id="SvgjsTspan2046">Nov</tspan><title>Nov</title></text><text id="SvgjsText2048" font-family="Helvetica, Arial, sans-serif" x="41.92708333333334" y="244.0302595876058" text-anchor="end" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;" transform="rotate(-45 1 -1)"><tspan id="SvgjsTspan2049"></tspan><title></title></text></g><line id="SvgjsLine2050" x1="0" y1="222.0302595876058" x2="43.75" y2="222.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1"></line></g><g id="SvgjsG2063" class="apexcharts-grid"><g id="SvgjsG2064" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine2079" x1="0" y1="0" x2="43.75" y2="0" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2080" x1="0" y1="55.25756489690145" x2="43.75" y2="55.25756489690145" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2081" x1="0" y1="110.5151297938029" x2="43.75" y2="110.5151297938029" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2082" x1="0" y1="165.77269469070436" x2="43.75" y2="165.77269469070436" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2083" x1="0" y1="221.0302595876058" x2="43.75" y2="221.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line></g><g id="SvgjsG2065" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine2066" x1="0" y1="222.0302595876058" x2="0" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2067" x1="3.6458333333333335" y1="222.0302595876058" x2="3.6458333333333335" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2068" x1="7.291666666666667" y1="222.0302595876058" x2="7.291666666666667" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2069" x1="10.9375" y1="222.0302595876058" x2="10.9375" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2070" x1="14.583333333333334" y1="222.0302595876058" x2="14.583333333333334" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2071" x1="18.229166666666668" y1="222.0302595876058" x2="18.229166666666668" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2072" x1="21.875" y1="222.0302595876058" x2="21.875" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2073" x1="25.520833333333332" y1="222.0302595876058" x2="25.520833333333332" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2074" x1="29.166666666666664" y1="222.0302595876058" x2="29.166666666666664" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2075" x1="32.8125" y1="222.0302595876058" x2="32.8125" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2076" x1="36.458333333333336" y1="222.0302595876058" x2="36.458333333333336" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2077" x1="40.10416666666667" y1="222.0302595876058" x2="40.10416666666667" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2078" x1="43.75000000000001" y1="222.0302595876058" x2="43.75000000000001" y2="228.0302595876058" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine2085" x1="0" y1="221.0302595876058" x2="43.75" y2="221.0302595876058" stroke="transparent" stroke-dasharray="0"></line><line id="SvgjsLine2084" x1="0" y1="1" x2="0" y2="221.0302595876058" stroke="transparent" stroke-dasharray="0"></line></g><g id="SvgjsG2086" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG2087" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG2088" class="apexcharts-point-annotations"></g><g id="SvgjsG1997" class="apexcharts-bar-series apexcharts-plot-series"><g id="SvgjsG1998" class="apexcharts-series" rel="1" seriesName="sales" data:realIndex="0"><path id="SvgjsPath2000" d="M 0.546875 221.0302595876058L 0.546875 158.86549907859165L 3.0989583333333335 158.86549907859165L 3.0989583333333335 158.86549907859165L 3.0989583333333335 221.0302595876058L 3.0989583333333335 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 0.546875 221.0302595876058L 0.546875 158.86549907859165L 3.0989583333333335 158.86549907859165L 3.0989583333333335 158.86549907859165L 3.0989583333333335 221.0302595876058L 3.0989583333333335 221.0302595876058z" pathFrom="M 0.546875 221.0302595876058L 0.546875 221.0302595876058L 3.0989583333333335 221.0302595876058L 3.0989583333333335 221.0302595876058L 3.0989583333333335 221.0302595876058L 0.546875 221.0302595876058" cy="158.86549907859165" cx="4.192708333333334" j="0" val="9" barHeight="62.16476050901413" barWidth="2.5520833333333335"></path><path id="SvgjsPath2001" d="M 4.192708333333334 221.0302595876058L 4.192708333333334 82.88634734535219L 6.744791666666668 82.88634734535219L 6.744791666666668 82.88634734535219L 6.744791666666668 221.0302595876058L 6.744791666666668 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 4.192708333333334 221.0302595876058L 4.192708333333334 82.88634734535219L 6.744791666666668 82.88634734535219L 6.744791666666668 82.88634734535219L 6.744791666666668 221.0302595876058L 6.744791666666668 221.0302595876058z" pathFrom="M 4.192708333333334 221.0302595876058L 4.192708333333334 221.0302595876058L 6.744791666666668 221.0302595876058L 6.744791666666668 221.0302595876058L 6.744791666666668 221.0302595876058L 4.192708333333334 221.0302595876058" cy="82.88634734535219" cx="7.838541666666668" j="1" val="20" barHeight="138.1439122422536" barWidth="2.5520833333333335"></path><path id="SvgjsPath2002" d="M 7.838541666666668 221.0302595876058L 7.838541666666668 13.814391224225375L 10.390625000000002 13.814391224225375L 10.390625000000002 13.814391224225375L 10.390625000000002 221.0302595876058L 10.390625000000002 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 7.838541666666668 221.0302595876058L 7.838541666666668 13.814391224225375L 10.390625000000002 13.814391224225375L 10.390625000000002 13.814391224225375L 10.390625000000002 221.0302595876058L 10.390625000000002 221.0302595876058z" pathFrom="M 7.838541666666668 221.0302595876058L 7.838541666666668 221.0302595876058L 10.390625000000002 221.0302595876058L 10.390625000000002 221.0302595876058L 10.390625000000002 221.0302595876058L 7.838541666666668 221.0302595876058" cy="13.814391224225375" cx="11.484375000000002" j="2" val="30" barHeight="207.21586836338042" barWidth="2.5520833333333335"></path><path id="SvgjsPath2003" d="M 11.484375000000002 221.0302595876058L 11.484375000000002 82.88634734535219L 14.036458333333336 82.88634734535219L 14.036458333333336 82.88634734535219L 14.036458333333336 221.0302595876058L 14.036458333333336 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 11.484375000000002 221.0302595876058L 11.484375000000002 82.88634734535219L 14.036458333333336 82.88634734535219L 14.036458333333336 82.88634734535219L 14.036458333333336 221.0302595876058L 14.036458333333336 221.0302595876058z" pathFrom="M 11.484375000000002 221.0302595876058L 11.484375000000002 221.0302595876058L 14.036458333333336 221.0302595876058L 14.036458333333336 221.0302595876058L 14.036458333333336 221.0302595876058L 11.484375000000002 221.0302595876058" cy="82.88634734535219" cx="15.130208333333336" j="3" val="20" barHeight="138.1439122422536" barWidth="2.5520833333333335"></path><path id="SvgjsPath2004" d="M 15.130208333333336 221.0302595876058L 15.130208333333336 151.95830346647898L 17.682291666666668 151.95830346647898L 17.682291666666668 151.95830346647898L 17.682291666666668 221.0302595876058L 17.682291666666668 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 15.130208333333336 221.0302595876058L 15.130208333333336 151.95830346647898L 17.682291666666668 151.95830346647898L 17.682291666666668 151.95830346647898L 17.682291666666668 221.0302595876058L 17.682291666666668 221.0302595876058z" pathFrom="M 15.130208333333336 221.0302595876058L 15.130208333333336 221.0302595876058L 17.682291666666668 221.0302595876058L 17.682291666666668 221.0302595876058L 17.682291666666668 221.0302595876058L 15.130208333333336 221.0302595876058" cy="151.95830346647898" cx="18.776041666666668" j="4" val="10" barHeight="69.0719561211268" barWidth="2.5520833333333335"></path><path id="SvgjsPath2005" d="M 18.776041666666668 221.0302595876058L 18.776041666666668 82.88634734535219L 21.328125 82.88634734535219L 21.328125 82.88634734535219L 21.328125 221.0302595876058L 21.328125 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 18.776041666666668 221.0302595876058L 18.776041666666668 82.88634734535219L 21.328125 82.88634734535219L 21.328125 82.88634734535219L 21.328125 221.0302595876058L 21.328125 221.0302595876058z" pathFrom="M 18.776041666666668 221.0302595876058L 18.776041666666668 221.0302595876058L 21.328125 221.0302595876058L 21.328125 221.0302595876058L 21.328125 221.0302595876058L 18.776041666666668 221.0302595876058" cy="82.88634734535219" cx="22.421875" j="5" val="20" barHeight="138.1439122422536" barWidth="2.5520833333333335"></path><path id="SvgjsPath2006" d="M 22.421875 221.0302595876058L 22.421875 13.814391224225375L 24.973958333333332 13.814391224225375L 24.973958333333332 13.814391224225375L 24.973958333333332 221.0302595876058L 24.973958333333332 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 22.421875 221.0302595876058L 22.421875 13.814391224225375L 24.973958333333332 13.814391224225375L 24.973958333333332 13.814391224225375L 24.973958333333332 221.0302595876058L 24.973958333333332 221.0302595876058z" pathFrom="M 22.421875 221.0302595876058L 22.421875 221.0302595876058L 24.973958333333332 221.0302595876058L 24.973958333333332 221.0302595876058L 24.973958333333332 221.0302595876058L 22.421875 221.0302595876058" cy="13.814391224225375" cx="26.067708333333332" j="6" val="30" barHeight="207.21586836338042" barWidth="2.5520833333333335"></path><path id="SvgjsPath2007" d="M 26.067708333333332 221.0302595876058L 26.067708333333332 82.88634734535219L 28.619791666666664 82.88634734535219L 28.619791666666664 82.88634734535219L 28.619791666666664 221.0302595876058L 28.619791666666664 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 26.067708333333332 221.0302595876058L 26.067708333333332 82.88634734535219L 28.619791666666664 82.88634734535219L 28.619791666666664 82.88634734535219L 28.619791666666664 221.0302595876058L 28.619791666666664 221.0302595876058z" pathFrom="M 26.067708333333332 221.0302595876058L 26.067708333333332 221.0302595876058L 28.619791666666664 221.0302595876058L 28.619791666666664 221.0302595876058L 28.619791666666664 221.0302595876058L 26.067708333333332 221.0302595876058" cy="82.88634734535219" cx="29.713541666666664" j="7" val="20" barHeight="138.1439122422536" barWidth="2.5520833333333335"></path><path id="SvgjsPath2008" d="M 29.713541666666664 221.0302595876058L 29.713541666666664 151.95830346647898L 32.265625 151.95830346647898L 32.265625 151.95830346647898L 32.265625 221.0302595876058L 32.265625 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 29.713541666666664 221.0302595876058L 29.713541666666664 151.95830346647898L 32.265625 151.95830346647898L 32.265625 151.95830346647898L 32.265625 221.0302595876058L 32.265625 221.0302595876058z" pathFrom="M 29.713541666666664 221.0302595876058L 29.713541666666664 221.0302595876058L 32.265625 221.0302595876058L 32.265625 221.0302595876058L 32.265625 221.0302595876058L 29.713541666666664 221.0302595876058" cy="151.95830346647898" cx="33.359375" j="8" val="10" barHeight="69.0719561211268" barWidth="2.5520833333333335"></path><path id="SvgjsPath2009" d="M 33.359375 221.0302595876058L 33.359375 82.88634734535219L 35.911458333333336 82.88634734535219L 35.911458333333336 82.88634734535219L 35.911458333333336 221.0302595876058L 35.911458333333336 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 33.359375 221.0302595876058L 33.359375 82.88634734535219L 35.911458333333336 82.88634734535219L 35.911458333333336 82.88634734535219L 35.911458333333336 221.0302595876058L 35.911458333333336 221.0302595876058z" pathFrom="M 33.359375 221.0302595876058L 33.359375 221.0302595876058L 35.911458333333336 221.0302595876058L 35.911458333333336 221.0302595876058L 35.911458333333336 221.0302595876058L 33.359375 221.0302595876058" cy="82.88634734535219" cx="37.005208333333336" j="9" val="20" barHeight="138.1439122422536" barWidth="2.5520833333333335"></path><path id="SvgjsPath2010" d="M 37.005208333333336 221.0302595876058L 37.005208333333336 13.814391224225375L 39.55729166666667 13.814391224225375L 39.55729166666667 13.814391224225375L 39.55729166666667 221.0302595876058L 39.55729166666667 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 37.005208333333336 221.0302595876058L 37.005208333333336 13.814391224225375L 39.55729166666667 13.814391224225375L 39.55729166666667 13.814391224225375L 39.55729166666667 221.0302595876058L 39.55729166666667 221.0302595876058z" pathFrom="M 37.005208333333336 221.0302595876058L 37.005208333333336 221.0302595876058L 39.55729166666667 221.0302595876058L 39.55729166666667 221.0302595876058L 39.55729166666667 221.0302595876058L 37.005208333333336 221.0302595876058" cy="13.814391224225375" cx="40.65104166666667" j="10" val="30" barHeight="207.21586836338042" barWidth="2.5520833333333335"></path><path id="SvgjsPath2011" d="M 40.65104166666667 221.0302595876058L 40.65104166666667 82.88634734535219L 43.20312500000001 82.88634734535219L 43.20312500000001 82.88634734535219L 43.20312500000001 221.0302595876058L 43.20312500000001 221.0302595876058z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="square" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskht7i9f27h)" pathTo="M 40.65104166666667 221.0302595876058L 40.65104166666667 82.88634734535219L 43.20312500000001 82.88634734535219L 43.20312500000001 82.88634734535219L 43.20312500000001 221.0302595876058L 43.20312500000001 221.0302595876058z" pathFrom="M 40.65104166666667 221.0302595876058L 40.65104166666667 221.0302595876058L 43.20312500000001 221.0302595876058L 43.20312500000001 221.0302595876058L 43.20312500000001 221.0302595876058L 40.65104166666667 221.0302595876058" cy="82.88634734535219" cx="44.29687500000001" j="11" val="20" barHeight="138.1439122422536" barWidth="2.5520833333333335"></path></g><g id="SvgjsG1999" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine2089" x1="0" y1="0" x2="43.75" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine2090" x1="0" y1="0" x2="43.75" y2="0" stroke-dasharray="0" stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG2051" class="apexcharts-yaxis" rel="0" transform="translate(9.25, 0)"><g id="SvgjsG2052" class="apexcharts-yaxis-texts-g"><text id="SvgjsText2053" font-family="Helvetica, Arial, sans-serif" x="20" y="31.4" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan2054">32</tspan></text><text id="SvgjsText2055" font-family="Helvetica, Arial, sans-serif" x="20" y="86.65756489690145" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan2056">24</tspan></text><text id="SvgjsText2057" font-family="Helvetica, Arial, sans-serif" x="20" y="141.9151297938029" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan2058">16</tspan></text><text id="SvgjsText2059" font-family="Helvetica, Arial, sans-serif" x="20" y="197.17269469070433" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan2060">8</tspan></text><text id="SvgjsText2061" font-family="Helvetica, Arial, sans-serif" x="20" y="252.43025958760578" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan2062">0</tspan></text></g></g><g id="SvgjsG1986" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 150px;"></div><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div><div class="apexcharts-toolbar" style="top: 0px; right: 3px;"><div class="apexcharts-menu-icon" title="Menu"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path></svg></div><div class="apexcharts-menu"><div class="apexcharts-menu-item exportSVG" title="Download SVG">Download SVG</div><div class="apexcharts-menu-item exportPNG" title="Download PNG">Download PNG</div><div class="apexcharts-menu-item exportCSV" title="Download CSV">Download CSV</div></div></div></div></div>
                                    <div class="resize-triggers"><div class="expand-trigger"><div style="width: 142px; height: 340px;"></div></div><div class="contract-trigger"></div></div></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-xl-4">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Profile Visit</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="d-flex align-items-center">
                                                <svg class="bi text-primary" width="32" height="32" fill="blue" style="width:10px">
                                                    <use xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill"></use>
                                                </svg>
                                                <h5 class="mb-0 ms-3">Europe</h5>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <h5 class="mb-0">862</h5>
                                        </div>
                                        <div class="col-12" style="position: relative;">
                                            <div id="chart-europe" style="min-height: 95px;"><div id="apexchartsgv3q5o4y" class="apexcharts-canvas apexchartsgv3q5o4y apexcharts-theme-light" style="width: 93px; height: 80px;"><svg id="SvgjsSvg2092" width="93" height="80" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg apexcharts-zoomable" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG2094" class="apexcharts-inner apexcharts-graphical" transform="translate(22, 30)"><defs id="SvgjsDefs2093"><clipPath id="gridRectMaskgv3q5o4y"><rect id="SvgjsRect2104" width="67" height="37" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMaskgv3q5o4y"><rect id="SvgjsRect2105" width="65" height="39" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><linearGradient id="SvgjsLinearGradient2110" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop2111" stop-opacity="0.65" stop-color="rgba(83,80,233,0.65)" offset="0"></stop><stop id="SvgjsStop2112" stop-opacity="0.5" stop-color="rgba(169,168,244,0.5)" offset="1"></stop><stop id="SvgjsStop2113" stop-opacity="0.5" stop-color="rgba(169,168,244,0.5)" offset="1"></stop></linearGradient></defs><line id="SvgjsLine2101" x1="0" y1="0" x2="0" y2="28" stroke="#b6b6b6" stroke-dasharray="3" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="28" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><g id="SvgjsG2116" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG2117" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"></g></g><g id="SvgjsG2122" class="apexcharts-grid"><g id="SvgjsG2123" class="apexcharts-gridlines-horizontal" style="display: none;"><line id="SvgjsLine2125" x1="0" y1="0" x2="61" y2="0" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2126" x1="0" y1="5" x2="61" y2="5" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2127" x1="0" y1="10" x2="61" y2="10" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2128" x1="0" y1="15" x2="61" y2="15" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2129" x1="0" y1="20" x2="61" y2="20" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2130" x1="0" y1="25" x2="61" y2="25" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2131" x1="0" y1="30" x2="61" y2="30" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2132" x1="0" y1="35" x2="61" y2="35" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line></g><g id="SvgjsG2124" class="apexcharts-gridlines-vertical" style="display: none;"></g><line id="SvgjsLine2134" x1="0" y1="35" x2="61" y2="35" stroke="transparent" stroke-dasharray="0"></line><line id="SvgjsLine2133" x1="0" y1="1" x2="0" y2="35" stroke="transparent" stroke-dasharray="0"></line></g><g id="SvgjsG2106" class="apexcharts-area-series apexcharts-plot-series"><g id="SvgjsG2107" class="apexcharts-series" seriesName="series1" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath2114" d="M 0 35L 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75C 61 14.75 61 14.75 61 35M 61 14.75z" fill="url(#SvgjsLinearGradient2110)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskgv3q5o4y)" pathTo="M 0 35L 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75C 61 14.75 61 14.75 61 35M 61 14.75z" pathFrom="M -1 45L -1 45L 7.956521739130435 45L 13.26086956521739 45L 18.565217391304348 45L 23.869565217391305 45L 29.17391304347826 45L 34.47826086956522 45L 39.78260869565217 45L 45.086956521739125 45L 50.391304347826086 45L 55.69565217391304 45L 61 45"></path><path id="SvgjsPath2115" d="M 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75" fill="none" fill-opacity="1" stroke="#5350e9" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskgv3q5o4y)" pathTo="M 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75" pathFrom="M -1 45L -1 45L 7.956521739130435 45L 13.26086956521739 45L 18.565217391304348 45L 23.869565217391305 45L 29.17391304347826 45L 34.47826086956522 45L 39.78260869565217 45L 45.086956521739125 45L 50.391304347826086 45L 55.69565217391304 45L 61 45"></path><g id="SvgjsG2108" class="apexcharts-series-markers-wrap" data:realIndex="0"><g class="apexcharts-series-markers"><circle id="SvgjsCircle2140" r="0" cx="0" cy="0" class="apexcharts-marker wktsevsh7 no-pointer-events" stroke="#ffffff" fill="#5350e9" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" default-marker-size="0"></circle></g></g></g><g id="SvgjsG2109" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine2135" x1="0" y1="0" x2="61" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine2136" x1="0" y1="0" x2="61" y2="0" stroke-dasharray="0" stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG2137" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG2138" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG2139" class="apexcharts-point-annotations"></g><rect id="SvgjsRect2141" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-zoom-rect"></rect><rect id="SvgjsRect2142" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-selection-rect"></rect></g><rect id="SvgjsRect2100" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG2120" class="apexcharts-yaxis" rel="0" transform="translate(-8, 0)"><g id="SvgjsG2121" class="apexcharts-yaxis-texts-g"></g></g><g id="SvgjsG2095" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 40px;"></div><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(83, 80, 233);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                                            <div class="resize-triggers"><div class="expand-trigger"><div style="width: 118px; height: 96px;"></div></div><div class="contract-trigger"></div></div></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="d-flex align-items-center">
                                                <svg class="bi text-success" width="32" height="32" fill="blue" style="width:10px">
                                                    <use xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill"></use>
                                                </svg>
                                                <h5 class="mb-0 ms-3">America</h5>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <h5 class="mb-0">375</h5>
                                        </div>
                                        <div class="col-12" style="position: relative;">
                                            <div id="chart-america" style="min-height: 95px;"><div id="apexcharts9og4og54" class="apexcharts-canvas apexcharts9og4og54 apexcharts-theme-light" style="width: 93px; height: 80px;"><svg id="SvgjsSvg2144" width="93" height="80" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg apexcharts-zoomable" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG2146" class="apexcharts-inner apexcharts-graphical" transform="translate(22, 30)"><defs id="SvgjsDefs2145"><clipPath id="gridRectMask9og4og54"><rect id="SvgjsRect2156" width="67" height="37" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMask9og4og54"><rect id="SvgjsRect2157" width="65" height="39" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><linearGradient id="SvgjsLinearGradient2162" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop2163" stop-opacity="0.65" stop-color="rgba(0,139,117,0.65)" offset="0"></stop><stop id="SvgjsStop2164" stop-opacity="0.5" stop-color="rgba(128,197,186,0.5)" offset="1"></stop><stop id="SvgjsStop2165" stop-opacity="0.5" stop-color="rgba(128,197,186,0.5)" offset="1"></stop></linearGradient></defs><line id="SvgjsLine2153" x1="0" y1="0" x2="0" y2="28" stroke="#b6b6b6" stroke-dasharray="3" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="28" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><g id="SvgjsG2168" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG2169" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"></g></g><g id="SvgjsG2174" class="apexcharts-grid"><g id="SvgjsG2175" class="apexcharts-gridlines-horizontal" style="display: none;"><line id="SvgjsLine2177" x1="0" y1="0" x2="61" y2="0" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2178" x1="0" y1="5" x2="61" y2="5" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2179" x1="0" y1="10" x2="61" y2="10" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2180" x1="0" y1="15" x2="61" y2="15" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2181" x1="0" y1="20" x2="61" y2="20" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2182" x1="0" y1="25" x2="61" y2="25" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2183" x1="0" y1="30" x2="61" y2="30" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2184" x1="0" y1="35" x2="61" y2="35" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line></g><g id="SvgjsG2176" class="apexcharts-gridlines-vertical" style="display: none;"></g><line id="SvgjsLine2186" x1="0" y1="35" x2="61" y2="35" stroke="transparent" stroke-dasharray="0"></line><line id="SvgjsLine2185" x1="0" y1="1" x2="0" y2="35" stroke="transparent" stroke-dasharray="0"></line></g><g id="SvgjsG2158" class="apexcharts-area-series apexcharts-plot-series"><g id="SvgjsG2159" class="apexcharts-series" seriesName="series1" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath2166" d="M 0 35L 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75C 61 14.75 61 14.75 61 35M 61 14.75z" fill="url(#SvgjsLinearGradient2162)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMask9og4og54)" pathTo="M 0 35L 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75C 61 14.75 61 14.75 61 35M 61 14.75z" pathFrom="M -1 45L -1 45L 7.956521739130435 45L 13.26086956521739 45L 18.565217391304348 45L 23.869565217391305 45L 29.17391304347826 45L 34.47826086956522 45L 39.78260869565217 45L 45.086956521739125 45L 50.391304347826086 45L 55.69565217391304 45L 61 45"></path><path id="SvgjsPath2167" d="M 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75" fill="none" fill-opacity="1" stroke="#008b75" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMask9og4og54)" pathTo="M 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75" pathFrom="M -1 45L -1 45L 7.956521739130435 45L 13.26086956521739 45L 18.565217391304348 45L 23.869565217391305 45L 29.17391304347826 45L 34.47826086956522 45L 39.78260869565217 45L 45.086956521739125 45L 50.391304347826086 45L 55.69565217391304 45L 61 45"></path><g id="SvgjsG2160" class="apexcharts-series-markers-wrap" data:realIndex="0"><g class="apexcharts-series-markers"><circle id="SvgjsCircle2192" r="0" cx="0" cy="0" class="apexcharts-marker w1drobi07 no-pointer-events" stroke="#ffffff" fill="#008b75" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" default-marker-size="0"></circle></g></g></g><g id="SvgjsG2161" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine2187" x1="0" y1="0" x2="61" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine2188" x1="0" y1="0" x2="61" y2="0" stroke-dasharray="0" stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG2189" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG2190" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG2191" class="apexcharts-point-annotations"></g><rect id="SvgjsRect2193" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-zoom-rect"></rect><rect id="SvgjsRect2194" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-selection-rect"></rect></g><rect id="SvgjsRect2152" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG2172" class="apexcharts-yaxis" rel="0" transform="translate(-8, 0)"><g id="SvgjsG2173" class="apexcharts-yaxis-texts-g"></g></g><g id="SvgjsG2147" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 40px;"></div><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(0, 139, 117);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                                            <div class="resize-triggers"><div class="expand-trigger"><div style="width: 118px; height: 96px;"></div></div><div class="contract-trigger"></div></div></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="d-flex align-items-center">
                                                <svg class="bi text-danger" width="32" height="32" fill="blue" style="width:10px">
                                                    <use xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill"></use>
                                                </svg>
                                                <h5 class="mb-0 ms-3">Indonesia</h5>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <h5 class="mb-0">1025</h5>
                                        </div>
                                        <div class="col-12" style="position: relative;">
                                            <div id="chart-indonesia" style="min-height: 95px;"><div id="apexchartsvhfuyawj" class="apexcharts-canvas apexchartsvhfuyawj apexcharts-theme-light" style="width: 93px; height: 80px;"><svg id="SvgjsSvg2196" width="93" height="80" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg apexcharts-zoomable" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG2198" class="apexcharts-inner apexcharts-graphical" transform="translate(22, 30)"><defs id="SvgjsDefs2197"><clipPath id="gridRectMaskvhfuyawj"><rect id="SvgjsRect2208" width="67" height="37" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMaskvhfuyawj"><rect id="SvgjsRect2209" width="65" height="39" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><linearGradient id="SvgjsLinearGradient2214" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop2215" stop-opacity="0.65" stop-color="rgba(220,53,69,0.65)" offset="0"></stop><stop id="SvgjsStop2216" stop-opacity="0.5" stop-color="rgba(238,154,162,0.5)" offset="1"></stop><stop id="SvgjsStop2217" stop-opacity="0.5" stop-color="rgba(238,154,162,0.5)" offset="1"></stop></linearGradient></defs><line id="SvgjsLine2205" x1="0" y1="0" x2="0" y2="28" stroke="#b6b6b6" stroke-dasharray="3" class="apexcharts-xcrosshairs" x="0" y="0" width="1" height="28" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><g id="SvgjsG2220" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG2221" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"></g></g><g id="SvgjsG2226" class="apexcharts-grid"><g id="SvgjsG2227" class="apexcharts-gridlines-horizontal" style="display: none;"><line id="SvgjsLine2229" x1="0" y1="0" x2="61" y2="0" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2230" x1="0" y1="5" x2="61" y2="5" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2231" x1="0" y1="10" x2="61" y2="10" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2232" x1="0" y1="15" x2="61" y2="15" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2233" x1="0" y1="20" x2="61" y2="20" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2234" x1="0" y1="25" x2="61" y2="25" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2235" x1="0" y1="30" x2="61" y2="30" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine2236" x1="0" y1="35" x2="61" y2="35" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line></g><g id="SvgjsG2228" class="apexcharts-gridlines-vertical" style="display: none;"></g><line id="SvgjsLine2238" x1="0" y1="35" x2="61" y2="35" stroke="transparent" stroke-dasharray="0"></line><line id="SvgjsLine2237" x1="0" y1="1" x2="0" y2="35" stroke="transparent" stroke-dasharray="0"></line></g><g id="SvgjsG2210" class="apexcharts-area-series apexcharts-plot-series"><g id="SvgjsG2211" class="apexcharts-series" seriesName="series1" data:longestSeries="true" rel="1" data:realIndex="0"><path id="SvgjsPath2218" d="M 0 35L 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75C 61 14.75 61 14.75 61 35M 61 14.75z" fill="url(#SvgjsLinearGradient2214)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="0" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskvhfuyawj)" pathTo="M 0 35L 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75C 61 14.75 61 14.75 61 35M 61 14.75z" pathFrom="M -1 45L -1 45L 7.956521739130435 45L 13.26086956521739 45L 18.565217391304348 45L 23.869565217391305 45L 29.17391304347826 45L 34.47826086956522 45L 39.78260869565217 45L 45.086956521739125 45L 50.391304347826086 45L 55.69565217391304 45L 61 45"></path><path id="SvgjsPath2219" d="M 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75" fill="none" fill-opacity="1" stroke="#dc3545" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-area" index="0" clip-path="url(#gridRectMaskvhfuyawj)" pathTo="M 0 29.5C 2.784782608695652 29.5 5.171739130434783 5 7.956521739130435 5C 9.81304347826087 5 11.404347826086957 15 13.26086956521739 15C 15.117391304347825 15 16.708695652173912 23.5 18.565217391304348 23.5C 20.421739130434784 23.5 22.01304347826087 18 23.869565217391305 18C 25.72608695652174 18 27.317391304347826 28 29.17391304347826 28C 31.030434782608697 28 32.62173913043478 14.75 34.47826086956522 14.75C 36.334782608695654 14.75 37.926086956521736 4.75 39.78260869565217 4.75C 41.63913043478261 4.75 43.23043478260869 23.5 45.086956521739125 23.5C 46.94347826086956 23.5 48.53478260869565 18 50.391304347826086 18C 52.24782608695652 18 53.839130434782604 28 55.69565217391304 28C 57.552173913043475 28 59.143478260869564 14.75 61 14.75" pathFrom="M -1 45L -1 45L 7.956521739130435 45L 13.26086956521739 45L 18.565217391304348 45L 23.869565217391305 45L 29.17391304347826 45L 34.47826086956522 45L 39.78260869565217 45L 45.086956521739125 45L 50.391304347826086 45L 55.69565217391304 45L 61 45"></path><g id="SvgjsG2212" class="apexcharts-series-markers-wrap" data:realIndex="0"><g class="apexcharts-series-markers"><circle id="SvgjsCircle2244" r="0" cx="0" cy="0" class="apexcharts-marker w9yy3w33ci no-pointer-events" stroke="#ffffff" fill="#dc3545" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" default-marker-size="0"></circle></g></g></g><g id="SvgjsG2213" class="apexcharts-datalabels" data:realIndex="0"></g></g><line id="SvgjsLine2239" x1="0" y1="0" x2="61" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine2240" x1="0" y1="0" x2="61" y2="0" stroke-dasharray="0" stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG2241" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG2242" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG2243" class="apexcharts-point-annotations"></g><rect id="SvgjsRect2245" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-zoom-rect"></rect><rect id="SvgjsRect2246" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe" class="apexcharts-selection-rect"></rect></g><rect id="SvgjsRect2204" width="0" height="0" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fefefe"></rect><g id="SvgjsG2224" class="apexcharts-yaxis" rel="0" transform="translate(-8, 0)"><g id="SvgjsG2225" class="apexcharts-yaxis-texts-g"></g></g><g id="SvgjsG2199" class="apexcharts-annotations"></g></svg><div class="apexcharts-legend" style="max-height: 40px;"></div><div class="apexcharts-tooltip apexcharts-theme-light"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(220, 53, 69);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom apexcharts-theme-light"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div></div><div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light"><div class="apexcharts-yaxistooltip-text"></div></div></div></div>
                                            <div class="resize-triggers"><div class="expand-trigger"><div style="width: 118px; height: 96px;"></div></div><div class="contract-trigger"></div></div></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-xl-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Latest Comments</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-lg">
                                            <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Comment</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="col-3">
                                                    <div class="d-flex align-items-center">
                                                        <div class="avatar avatar-md">
                                                            <img src="assets/images/faces/5.jpg">
                                                        </div>
                                                        <p class="font-bold ms-3 mb-0">Si Cantik</p>
                                                    </div>
                                                </td>
                                                <td class="col-auto">
                                                    <p class=" mb-0">Congratulations on your graduation!</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-3">
                                                    <div class="d-flex align-items-center">
                                                        <div class="avatar avatar-md">
                                                            <img src="assets/images/faces/2.jpg">
                                                        </div>
                                                        <p class="font-bold ms-3 mb-0">Si Ganteng</p>
                                                    </div>
                                                </td>
                                                <td class="col-auto">
                                                    <p class=" mb-0">Wow amazing design! Can you make another
                                                        tutorial for
                                                        this design?</p>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-3">
                    <div class="card">
                        <div class="card-body py-4 px-5">
                            <div class="d-flex align-items-center">
                                <div class="avatar avatar-xl">
                                    <img src="assets/images/faces/1.jpg" alt="Face 1">
                                </div>
                                <div class="ms-3 name">
                                    <h5 class="font-bold">John Duck</h5>
                                    <h6 class="text-muted mb-0">@johnducky</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4>Recent Messages</h4>
                        </div>
                        <div class="card-content pb-4">
                            <div class="recent-message d-flex px-4 py-3">
                                <div class="avatar avatar-lg">
                                    <img src="assets/images/faces/4.jpg">
                                </div>
                                <div class="name ms-4">
                                    <h5 class="mb-1">Hank Schrader</h5>
                                    <h6 class="text-muted mb-0">@johnducky</h6>
                                </div>
                            </div>
                            <div class="recent-message d-flex px-4 py-3">
                                <div class="avatar avatar-lg">
                                    <img src="assets/images/faces/5.jpg">
                                </div>
                                <div class="name ms-4">
                                    <h5 class="mb-1">Dean Winchester</h5>
                                    <h6 class="text-muted mb-0">@imdean</h6>
                                </div>
                            </div>
                            <div class="recent-message d-flex px-4 py-3">
                                <div class="avatar avatar-lg">
                                    <img src="assets/images/faces/1.jpg">
                                </div>
                                <div class="name ms-4">
                                    <h5 class="mb-1">John Dodol</h5>
                                    <h6 class="text-muted mb-0">@dodoljohn</h6>
                                </div>
                            </div>
                            <div class="px-4">
                                <button class="btn btn-block btn-xl btn-light-primary font-bold mt-3">Start
                                    Conversation</button>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h4>Visitors Profile</h4>
                        </div>
                        <div class="card-body" style="position: relative;">
                            <div id="chart-visitors-profile" style="min-height: 119.7px;"><div id="apexchartso3gvvyu5l" class="apexcharts-canvas apexchartso3gvvyu5l apexcharts-theme-light" style="width: 93px; height: 119.7px;"><svg id="SvgjsSvg2285" width="93" height="119.70000000000002" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><foreignObject x="0" y="0" width="93" height="119.70000000000002"><div class="apexcharts-legend apexcharts-align-center position-bottom" xmlns="http://www.w3.org/1999/xhtml" style="inset: auto 0px 1px; position: absolute; max-height: 175px;"><div class="apexcharts-legend-series" rel="1" seriesname="Male" data:collapsed="false" style="margin: 2px 5px;"><span class="apexcharts-legend-marker" rel="1" data:collapsed="false" style="background: rgb(67, 94, 190) !important; color: rgb(67, 94, 190); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="1" i="0" data:default-text="Male" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Male</span></div><div class="apexcharts-legend-series" rel="2" seriesname="Female" data:collapsed="false" style="margin: 2px 5px;"><span class="apexcharts-legend-marker" rel="2" data:collapsed="false" style="background: rgb(85, 198, 232) !important; color: rgb(85, 198, 232); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span class="apexcharts-legend-text" rel="2" i="1" data:default-text="Female" data:collapsed="false" style="color: rgb(55, 61, 63); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">Female</span></div></div><style type="text/css">

                                .apexcharts-legend {
                                    display: flex;
                                    overflow: auto;
                                    padding: 0 10px;
                                }
                                .apexcharts-legend.position-bottom, .apexcharts-legend.position-top {
                                    flex-wrap: wrap
                                }
                                .apexcharts-legend.position-right, .apexcharts-legend.position-left {
                                    flex-direction: column;
                                    bottom: 0;
                                }
                                .apexcharts-legend.position-bottom.apexcharts-align-left, .apexcharts-legend.position-top.apexcharts-align-left, .apexcharts-legend.position-right, .apexcharts-legend.position-left {
                                    justify-content: flex-start;
                                }
                                .apexcharts-legend.position-bottom.apexcharts-align-center, .apexcharts-legend.position-top.apexcharts-align-center {
                                    justify-content: center;
                                }
                                .apexcharts-legend.position-bottom.apexcharts-align-right, .apexcharts-legend.position-top.apexcharts-align-right {
                                    justify-content: flex-end;
                                }
                                .apexcharts-legend-series {
                                    cursor: pointer;
                                    line-height: normal;
                                }
                                .apexcharts-legend.position-bottom .apexcharts-legend-series, .apexcharts-legend.position-top .apexcharts-legend-series{
                                    display: flex;
                                    align-items: center;
                                }
                                .apexcharts-legend-text {
                                    position: relative;
                                    font-size: 14px;
                                }
                                .apexcharts-legend-text *, .apexcharts-legend-marker * {
                                    pointer-events: none;
                                }
                                .apexcharts-legend-marker {
                                    position: relative;
                                    display: inline-block;
                                    cursor: pointer;
                                    margin-right: 3px;
                                    border-style: solid;
                                }

                                .apexcharts-legend.apexcharts-align-right .apexcharts-legend-series, .apexcharts-legend.apexcharts-align-left .apexcharts-legend-series{
                                    display: inline-block;
                                }
                                .apexcharts-legend-series.apexcharts-no-click {
                                    cursor: auto;
                                }
                                .apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series {
                                    display: none !important;
                                }
                                .apexcharts-inactive-legend {
                                    opacity: 0.45;
                                }</style></foreignObject><g id="SvgjsG2287" class="apexcharts-inner apexcharts-graphical" transform="translate(12, 0)"><defs id="SvgjsDefs2286"><clipPath id="gridRectMasko3gvvyu5l"><rect id="SvgjsRect2289" width="77" height="271" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><clipPath id="gridRectMarkerMasko3gvvyu5l"><rect id="SvgjsRect2290" width="75" height="273" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath><filter id="SvgjsFilter2299" filterUnits="userSpaceOnUse" width="200%" height="200%" x="-50%" y="-50%"><feFlood id="SvgjsFeFlood2300" flood-color="#000000" flood-opacity="0.45" result="SvgjsFeFlood2300Out" in="SourceGraphic"></feFlood><feComposite id="SvgjsFeComposite2301" in="SvgjsFeFlood2300Out" in2="SourceAlpha" operator="in" result="SvgjsFeComposite2301Out"></feComposite><feOffset id="SvgjsFeOffset2302" dx="1" dy="1" result="SvgjsFeOffset2302Out" in="SvgjsFeComposite2301Out"></feOffset><feGaussianBlur id="SvgjsFeGaussianBlur2303" stdDeviation="1 " result="SvgjsFeGaussianBlur2303Out" in="SvgjsFeOffset2302Out"></feGaussianBlur><feMerge id="SvgjsFeMerge2304" result="SvgjsFeMerge2304Out" in="SourceGraphic"><feMergeNode id="SvgjsFeMergeNode2305" in="SvgjsFeGaussianBlur2303Out"></feMergeNode><feMergeNode id="SvgjsFeMergeNode2306" in="[object Arguments]"></feMergeNode></feMerge><feBlend id="SvgjsFeBlend2307" in="SourceGraphic" in2="SvgjsFeMerge2304Out" mode="normal" result="SvgjsFeBlend2307Out"></feBlend></filter><filter id="SvgjsFilter2312" filterUnits="userSpaceOnUse" width="200%" height="200%" x="-50%" y="-50%"><feFlood id="SvgjsFeFlood2313" flood-color="#000000" flood-opacity="0.45" result="SvgjsFeFlood2313Out" in="SourceGraphic"></feFlood><feComposite id="SvgjsFeComposite2314" in="SvgjsFeFlood2313Out" in2="SourceAlpha" operator="in" result="SvgjsFeComposite2314Out"></feComposite><feOffset id="SvgjsFeOffset2315" dx="1" dy="1" result="SvgjsFeOffset2315Out" in="SvgjsFeComposite2314Out"></feOffset><feGaussianBlur id="SvgjsFeGaussianBlur2316" stdDeviation="1 " result="SvgjsFeGaussianBlur2316Out" in="SvgjsFeOffset2315Out"></feGaussianBlur><feMerge id="SvgjsFeMerge2317" result="SvgjsFeMerge2317Out" in="SourceGraphic"><feMergeNode id="SvgjsFeMergeNode2318" in="SvgjsFeGaussianBlur2316Out"></feMergeNode><feMergeNode id="SvgjsFeMergeNode2319" in="[object Arguments]"></feMergeNode></feMerge><feBlend id="SvgjsFeBlend2320" in="SourceGraphic" in2="SvgjsFeMerge2317Out" mode="normal" result="SvgjsFeBlend2320Out"></feBlend></filter></defs><g id="SvgjsG2291" class="apexcharts-pie"><g id="SvgjsG2292" transform="translate(0, 0) scale(1)"><circle id="SvgjsCircle2293" r="8.590243902439026" cx="35.5" cy="35.5" fill="transparent"></circle><g id="SvgjsG2294" class="apexcharts-slices"><g id="SvgjsG2295" class="apexcharts-series apexcharts-pie-series" seriesName="Male" rel="1" data:realIndex="0"><path id="SvgjsPath2296" d="M 35.5 6.8658536585365795 A 28.63414634146342 28.63414634146342 0 1 1 8.267308533402183 44.348437838931424 L 27.330192560020656 38.15453135167943 A 8.590243902439026 8.590243902439026 0 1 0 35.5 26.909756097560972 L 35.5 6.8658536585365795 z" fill="rgba(67,94,190,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-0" index="0" j="0" data:angle="252" data:startAngle="0" data:strokeWidth="2" data:value="70" data:pathOrig="M 35.5 6.8658536585365795 A 28.63414634146342 28.63414634146342 0 1 1 8.267308533402183 44.348437838931424 L 27.330192560020656 38.15453135167943 A 8.590243902439026 8.590243902439026 0 1 0 35.5 26.909756097560972 L 35.5 6.8658536585365795 z" stroke="#ffffff"></path></g><g id="SvgjsG2308" class="apexcharts-series apexcharts-pie-series" seriesName="Female" rel="2" data:realIndex="1"><path id="SvgjsPath2309" d="M 8.267308533402183 44.348437838931424 A 28.63414634146342 28.63414634146342 0 0 1 35.495002398703804 6.865854094659564 L 35.498500719611144 26.909756228397868 A 8.590243902439026 8.590243902439026 0 0 0 27.330192560020656 38.15453135167943 L 8.267308533402183 44.348437838931424 z" fill="rgba(85,198,232,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="butt" stroke-width="2" stroke-dasharray="0" class="apexcharts-pie-area apexcharts-donut-slice-1" index="0" j="1" data:angle="108" data:startAngle="252" data:strokeWidth="2" data:value="30" data:pathOrig="M 8.267308533402183 44.348437838931424 A 28.63414634146342 28.63414634146342 0 0 1 35.495002398703804 6.865854094659564 L 35.498500719611144 26.909756228397868 A 8.590243902439026 8.590243902439026 0 0 0 27.330192560020656 38.15453135167943 L 8.267308533402183 44.348437838931424 z" stroke="#ffffff"></path></g><g id="SvgjsG2297" class="apexcharts-datalabels"><text id="SvgjsText2298" font-family="Helvetica, Arial, sans-serif" x="50.557582156281036" y="46.43997380547284" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="600" fill="#ffffff" class="apexcharts-text apexcharts-pie-label" filter="url(#SvgjsFilter2299)" style="font-family: Helvetica, Arial, sans-serif;">70.0%</text></g><g id="SvgjsG2310" class="apexcharts-datalabels"><text id="SvgjsText2311" font-family="Helvetica, Arial, sans-serif" x="20.442417843718964" y="24.560026194527165" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="600" fill="#ffffff" class="apexcharts-text apexcharts-pie-label" filter="url(#SvgjsFilter2312)" style="font-family: Helvetica, Arial, sans-serif;">30.0%</text></g></g></g></g><line id="SvgjsLine2321" x1="0" y1="0" x2="71" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine2322" x1="0" y1="0" x2="71" y2="0" stroke-dasharray="0" stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line></g><g id="SvgjsG2288" class="apexcharts-annotations"></g></svg><div class="apexcharts-tooltip apexcharts-theme-dark"><div class="apexcharts-tooltip-series-group" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(67, 94, 190);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div><div class="apexcharts-tooltip-series-group" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(85, 198, 232);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label"></span><span class="apexcharts-tooltip-text-value"></span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div></div></div>
                            <div class="resize-triggers"><div class="expand-trigger"><div style="width: 142px; height: 145px;"></div></div><div class="contract-trigger"></div></div></div>
                    </div>
                </div>
            </section>
        </div>

        <footer>
            <div class="footer clearfix mb-0 text-muted">
                <div class="float-start">
                    <p>2021 © Mazer</p>
                </div>
                <div class="float-end">
                    <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">A. Saugi</a></p>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>

<script src="assets/vendors/apexcharts/apexcharts.js"></script>
<script src="/js/pages/dashboard.js"></script>

<script src="/js/main.js"></script>


<svg id="SvgjsSvg1302" width="2" height="0" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" style="overflow: hidden; top: -100%; left: -100%; position: absolute; opacity: 0;"><defs id="SvgjsDefs1303"></defs><polyline id="SvgjsPolyline1304" points="0,0"></polyline><path id="SvgjsPath1305" d="M-1 45L-1 45C-1 45 16.565217391304348 45 16.565217391304348 45C16.565217391304348 45 27.608695652173914 45 27.608695652173914 45C27.608695652173914 45 38.65217391304348 45 38.65217391304348 45C38.65217391304348 45 49.69565217391305 45 49.69565217391305 45C49.69565217391305 45 60.73913043478261 45 60.73913043478261 45C60.73913043478261 45 71.78260869565217 45 71.78260869565217 45C71.78260869565217 45 82.82608695652173 45 82.82608695652173 45C82.82608695652173 45 93.86956521739131 45 93.86956521739131 45C93.86956521739131 45 104.91304347826087 45 104.91304347826087 45C104.91304347826087 45 115.95652173913044 45 115.95652173913044 45C115.95652173913044 45 127 45 127 45C127 45 127 45 127 45 "></path></svg>
</body>
</html>

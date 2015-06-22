<%--
  ADOBE CONFIDENTIAL

  Copyright 2013 Adobe Systems Incorporated
  All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and may be covered by U.S. and Foreign Patents,
  patents in process, and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
--%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%
%><%@page session="false"
          import="com.adobe.granite.ui.components.AttrBuilder,
                  com.adobe.granite.ui.components.Config,
                  com.adobe.granite.ui.components.Tag" %><%

    // Here, following the same logic, we're generating the (optional) markup corresponding to the read-only state (cf. Page properties "view" mode)
    // This part can be omitted if the widget is not supposed to be used within the Page properties for instance.

    Config cfg = cmp.getConfig();

    Tag tag = cmp.consumeTag();
    AttrBuilder attrs = tag.getAttrs();

    String fieldLabel = cfg.get("fieldLabel", String.class);
    String value = cmp.getValue().val(cmp.getExpressionHelper().getString(cfg.get("value", "")));

    // The field is a "root field" if it is not included by another field (= not used within a composite field)
    // In this case, we generate an additional wrapper around the field, plus its label...
    if (cmp.getOptions().rootField()) {
        attrs.addClass("coral-Form-fieldwrapper");

        %><span <%= attrs.build() %>><%
        if (fieldLabel != null) {
            %><label class="coral-Form-fieldlabel"><%= outVar(xssAPI, i18n, fieldLabel) %></label><%
        }
        %><span class="coral-Form-field"><%= xssAPI.filterHTML(value) %></span
        ></span><%
    // ...otherwise, we only generate the markup corresponding to the field itself
    } else {
        %><span <%= attrs.build() %>><%= xssAPI.filterHTML(value) %></span><%
    }
%>
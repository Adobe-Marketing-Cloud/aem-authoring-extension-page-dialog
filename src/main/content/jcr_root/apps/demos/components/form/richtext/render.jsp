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
                  com.adobe.granite.ui.components.Field,
                  com.adobe.granite.ui.components.Tag" %><%

    // Get the component config (properties)
    Config cfg = cmp.getConfig();

    // Get the actual value of the field (thanks to inherited init.jsp)
    ValueMap vm = (ValueMap) request.getAttribute(Field.class.getName());

    boolean isMixed = new Field(cfg).isMixed(cmp.getValue());

    //
    // (1) Build the wrapper element markup
    //
    // Use ComponentHelper to consume the current available tag
    Tag tag = cmp.consumeTag();

    // Use AttrBuilder to append HTML attributes in order to abstract the markup generation
    AttrBuilder attrs = tag.getAttrs();

    // Automatically handle common attributes (id, rel, class, title, hidden, data-*, etc.)
    cmp.populateCommonAttrs(attrs);

    // Use custom class (to be used in the clientlib to add JS behavior / customize CSS style)
    attrs.addClass("cq-RichText-field");

    // Handle mixed state (prevent field submission when value is mixed)
    if (isMixed) {
        attrs.addClass("foundation-field-mixed");
        attrs.add("data-label-mixed", i18n.get("This field has different values"));
    }


    //
    // (2) Build the input element markup
    //
    AttrBuilder inputAttrs = new AttrBuilder(request, xssAPI);
    inputAttrs.add("type", "hidden");
    inputAttrs.add("name", cfg.get("name", String.class));
    inputAttrs.add("value", vm.get("value", String.class));
    inputAttrs.addDisabled(cfg.get("disabled", false));
	inputAttrs.add("data-validation", cfg.get("validation", String.class));

    if (cfg.get("required", false)) {
        inputAttrs.add("aria-required", true);
    }


    //
    // (3) Build the RTE element markup
    //
    AttrBuilder rteAttrs = new AttrBuilder(request, xssAPI);
    rteAttrs.addClass("coral-Form-field coral-Textfield coral-Textfield--multiline coral-RichText");


    //
    // (4) Generate markup
    //
%><div <%= attrs.build() %>>
    <input <%= inputAttrs.build() %>>
    <div <%= rteAttrs.build() %>></div>
</div>
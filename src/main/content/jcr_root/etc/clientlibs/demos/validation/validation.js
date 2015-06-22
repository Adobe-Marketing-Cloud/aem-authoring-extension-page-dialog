/*
 *
 * ADOBE CONFIDENTIAL
 * __________________
 *
 *  Copyright 2015 Adobe Systems Incorporated
 *  All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 */
(function(document, $, Granite) {
    "use strict";

    $.validator.register({
        selector: "form [data-validation='demos.notest']",
        validate: function(el) {
			var val = el.val();
            if (val.toUpperCase() === "TEST") {
                return Granite.I18n.get("Please don't use \"Test\" as a value here");
            }
        }
    });

})(document, Granite.$, Granite);

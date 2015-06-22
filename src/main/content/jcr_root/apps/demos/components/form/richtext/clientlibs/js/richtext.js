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
$(document).on("foundation-contentloaded", function(event) {
    "use strict";

    var rteWidgets = $(event.target).find(".cq-RichText-field");

    if (rteWidgets.length) {
        // Copy hidden text field value to RTE
        rteWidgets.each(function() {
            var el = $(this);
            var input = el.find("input[type=hidden]");
            var rte = el.find(".coral-RichText");

            var html = input.val();
			rte.empty().append(html);
        });

        // Copy RTE text to hidden field
        rteWidgets.on("editing-finished", ".coral-RichText", function() {
            var el = $(this).closest(".cq-RichText-field");
            var input = el.find("input[type=hidden]");
            var rte = el.find(".coral-RichText");
            var html = rte.html();

            if (input.val() !== html) {
                input.val(rte.html());
	            input.trigger("change");
            }
        });
    }
});
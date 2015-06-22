/*
 * ADOBE CONFIDENTIAL
 *
 * Copyright 2015 Adobe Systems Incorporated
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 */
(function(document, $, Granite) {
    "use strict";

    // Provide setDisabled method of foundation-field API
    $(window).adaptTo("foundation-registry").register("foundation.adapters", {
        type: "foundation-field",
        selector: ".cq-RichText-field",
        adapter: function(el) {
            var rteField = $(el);

            return {
                setDisabled: function(disabled) {
                    var input = rteField.find("input");
                    var api = input.adaptTo("foundation-field");
                    if (api && api.setDisabled) {
                        api.setDisabled(disabled);
                    }
                }
            };
        }
    });

    // Provide setMixed method of foundation-field-mixed API
    $(window).adaptTo("foundation-registry").register("foundation.adapters", {
        type: "foundation-field-mixed",
        selector: ".cq-RichText-field",
        adapter: function(el) {
            var field = $(el);

            return {
                setMixed: function (mixed) {
                    field.toggleClass("foundation-field-mixed", mixed);
                }
            };
        }
    });

})(document, Granite.$, Granite);

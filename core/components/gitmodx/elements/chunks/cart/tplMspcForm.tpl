<div class="promocode">
    <div class="row">
        <div class="mspc_form">
            <div class="col-7 col-xs-7">
                <div>
                    <div class="input-group">
                        <span class="input-group-prepend input-group-addon">
                          <span class="input-group-text">Промо-код</span>
                        </span>
                        <input type="text" class="mspc_field form-control [[+coupon:notempty=`[[+disfield]]`]]" [[+coupon:notempty=`disabled`]] value="[[+coupon]]" placeholder="{$_modx->lexicon('coupon_code_placeholder')}" />
                        <span class="input-group-append input-group-btn">
                            <button type="button" class="mspc_btn btn btn-default btn-secondary">[[+btn]]</button>
                        </span>
                    </div>
                    <div class="mspc_coupon_description" style="display: none;"></div>
                </div>
                <div class="mspc_msg"></div>
            </div>
            <div class="col-5 col-xs-5">
                <div class="mspc_discount_amount" style="display:none; margin-top:7px;"><b>{$_modx->lexicon('coupon_discount')}</b>: <span>[[+discount_amount]]</span> грн.</div>
            </div>
        </div>
    </div>
</div>

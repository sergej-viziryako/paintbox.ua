{set $rgb = $_modx->runSnippet('msProductOptions',['product' => "{$id}", 'onlyOptions' => 'rgb', 'tpl' => 'tplProductOptionsColor'])}
<li>
    <form method="post" class="ms2_form">
        <input type="hidden" name="id" value="{$id}"/>
        <div class="inner">
            <div class="description-main-product">
                <div class="description-title column25">
                    <div class="img" style="background: rgb({$rgb})!important;"></div>
                </div>
                <div class="description-title column40">
                    {$pagetitle}
                </div>
                <div class="description-title column25">
                    {$_modx->runSnippet('msProductOptions',['product' => "{$id}", 'onlyOptions' => 'chip', 'tpl' => 'tplProductOptionsColor'])}
                </div>
                <div class="description-title column10">
                    {$_modx->runSnippet('msProductOptions',['product' => "{$id}", 'onlyOptions' => 'code', 'tpl' => 'tplProductOptionsColor'])}
                </div>
            </div>
            <div class="description-order-product">
                <div class="description-title column25">
                    <select name="options[size]" id="option_size">
                        <option value="1л">1л</option>
                        <option value="2л">2л</option>
                        <option value="3л">3л</option>
                    </select>
                </div>
                <div class="description-title column25">
                    <span>{$price}</span> грн
                </div>
                <div class="description-title column25">
                    <div class="number quantity">
                        <input class="numeral" name="count" type="number" min="1" step="1" value="1">
                    </div>
                </div>
                <button class="buy column25" type="submit" name="ms2_action" value="cart/add">
                    <span>{$_modx->lexicon('buy_button')}</span>
                </button>
            </div>
        </div>
    </form>
</li>
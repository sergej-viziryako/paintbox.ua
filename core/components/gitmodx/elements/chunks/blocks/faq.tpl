{if $_modx->resource.template == 20}
  {set $rows = json_decode($_modx->resource.parent | resource : 'faq', true)}
{else}
  {set $rows = json_decode($_modx->resource.id | resource : 'faq', true)}
{/if}
{if $rows?}
  <section class="section- section-questions-answers">
    <div class="container">
      <div class="section-caption">
        <div class="caption">
          <span>{$_modx->lexicon('faq_block_title')} на {$_modx->runSnippet('dateTodayMin')}</span>
        </div>
      </div>
      <div class="questansw-block">
        <ul class="questansw accordion-questansw" itemscope="" itemtype="https://schema.org/FAQPage">
          {foreach $rows as $row first=$first}
            {if $_modx->config.cultureKey != 'ua'}
                {set $question = $row.question}
                {set $answer = $row.answer}
            {else}
                {set $question = $row.questionUA}
                {set $answer = $row.answerUA}
            {/if}
            {if $question?}
              <li {if $first?}class="active"{/if} itemprop="mainEntity" itemscope="" itemtype="https://schema.org/Question">
                <a href="#" class="opener">
                  <span class="img">
                    <i class="icon-right-arrow"></i>
                  </span>
                  <span itemprop="name">{$question}</span>
                </a>
                <div class="slide" itemscope="" itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                  <span itemprop="text">{$answer}</span>
                </div>
              </li>
            {/if}
          {/foreach}
        </ul>
      </div>
    </div>
  </section>
{/if}
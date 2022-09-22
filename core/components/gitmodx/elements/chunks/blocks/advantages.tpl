{set $rows = json_decode(1 | resource : 'advantages', true)}
{if $rows?}
  <section class="section- section-advant">
    <div class="container">
      <div class="advant-block">
        <ul class="advant">
          {foreach $rows as $row}
            {if $_modx->config.cultureKey != 'ru'}
              {set $title = $row.titleUA}
              {set $desc = $row.descUA}
            {else}
              {set $title = $row.title}
              {set $desc = $row.desc}
            {/if}
            <li>
              <div class="inner">
                <div class="img">
                  <i class="{$row.icon}"></i>
                </div>
                <div class="text">
                  <div class="caption">{$title}</div>
                  <div class="description">
                    <p>{$desc}</p>
                  </div>
                </div>
              </div>
            </li>
          {/foreach}
        </ul>
      </div>
    </div>
  </section>
{/if}
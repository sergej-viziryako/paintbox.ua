{set $tags = $_modx->runSnippet( 'tagCloud',[ 'tvname' => 'tags', 'active' => ''~$.get.tag~''] )}
{if $tags?}
  <div class="tags-block">
    <ul class="tags">
      <li {if !$.get.tag} class="active" {/if}>
        <a href="{$_modx->makeUrl($_modx->resource.id)}">{$_modx->lexicon('see_all_tags')}</a>
      </li>
        {$tags}
    </ul>
  </div>
{/if}
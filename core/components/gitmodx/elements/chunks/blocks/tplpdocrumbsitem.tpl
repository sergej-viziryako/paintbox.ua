{set $array_emoji = ['🚙','🛠','🚗','🚙','🎨']}
<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
    <a rel="{$menutitle}" itemprop="item"  href="{$link}">
        <span itemprop="name">{$array_emoji[$idx]} {$menutitle}</span>
    </a>
    <meta itemprop="position" content="{$idx}" />
</li>
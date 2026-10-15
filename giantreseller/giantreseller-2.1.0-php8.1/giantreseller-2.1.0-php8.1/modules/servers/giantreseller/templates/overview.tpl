{* Shown until the service is set up, or when its details cannot be read. *}
<div class="alert alert-info text-center">
    {if $state eq 'setting_up'}
        {$lang.setting_up|escape}
    {else}
        {$lang.unavailable|escape}
    {/if}
</div>

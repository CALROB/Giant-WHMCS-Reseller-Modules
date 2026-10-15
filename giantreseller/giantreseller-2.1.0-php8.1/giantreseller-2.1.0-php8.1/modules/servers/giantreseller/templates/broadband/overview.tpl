<h3>{$lang.bb_connection|escape}</h3>
<table class="table">
    <tr>
        <th style="width:40%">{$lang.bb_connection|escape}</th>
        <td>
            {if $gr.online === null}{$lang.bb_unknown|escape}
            {elseif $gr.online}<span class="label label-success">{$lang.bb_online|escape}</span>
            {else}<span class="label label-default">{$lang.bb_offline|escape}</span>{/if}
        </td>
    </tr>
    {if $gr.online}
    <tr><th>{$lang.bb_online_for|escape}</th><td>{$gr.online_for|escape}</td></tr>
    <tr><th>{$lang.bb_ip|escape}</th><td>{$gr.ip|escape}</td></tr>
    {/if}
</table>

<h3>{$lang.bb_progress|escape}</h3>
{if $gr.tracked && $gr.journey}
<ul class="list-unstyled">
    {foreach $gr.journey as $step}
        <li>
            {if $step.state eq 'done'}<i class="fas fa-check-circle text-success"></i>
            {elseif $step.state eq 'current'}<i class="fas fa-dot-circle text-primary"></i>
            {elseif $step.state eq 'bad'}<i class="fas fa-exclamation-circle text-danger"></i>
            {else}<i class="far fa-circle text-muted"></i>{/if}
            {$step.label|escape}{if $step.date} <span class="text-muted">({$step.date|escape})</span>{/if}
        </li>
    {/foreach}
</ul>
{if $gr.took}<p>{$lang.bb_took|escape}: {$gr.took|escape}</p>{/if}
{else}
<p class="text-muted">{$lang.bb_not_tracked|escape}</p>
{/if}

<p class="text-muted small">{$lang.refresh_note|escape}</p>

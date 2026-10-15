{assign var=tpl value="`$smarty.current_dir`/../_action.tpl"}

<h3>{$lang.voip_numbers|escape}</h3>
{if $gr.numbers}
<div class="table-responsive">
<table class="table table-striped">
    <thead><tr>
        <th>{$lang.voip_number|escape}</th>
        <th>{$lang.voip_label|escape}</th>
        <th>{$lang.voip_divert|escape}</th>
    </tr></thead>
    <tbody>
    {foreach $gr.numbers as $n}
        <tr>
            <td>{$n.number|escape}</td>
            <td>{$n.label|escape}</td>
            <td>
                {if $n.divert}<span class="label label-warning">{$lang.on|escape}</span>{else}<span class="label label-default">{$lang.off|escape}</span>{/if}
                {if $gr.can_divert}
                {include file=$tpl action='voip_divert'}
                    <input type="hidden" name="number" value="{$n.number|escape}">
                    <input type="hidden" name="on" value="{if $n.divert}0{else}1{/if}">
                    <button type="submit" class="btn btn-xs btn-default">{if $n.divert}{$lang.voip_divert_off|escape}{else}{$lang.voip_divert_on|escape}{/if}</button>
                </form>
                {/if}
            </td>
        </tr>
    {/foreach}
    </tbody>
</table>
</div>
{else}
<p class="text-muted">{$lang.voip_no_numbers|escape}</p>
{/if}

<h3>{$lang.voip_extensions|escape}</h3>
{if $gr.extensions}
<div class="table-responsive">
<table class="table table-striped">
    <thead><tr>
        <th>{$lang.voip_extension|escape}</th>
        <th>{$lang.voip_name|escape}</th>
        <th>{$lang.voip_state|escape}</th>
        {if $gr.can_dnd}<th>{$lang.voip_dnd|escape}</th>{/if}
    </tr></thead>
    <tbody>
    {foreach $gr.extensions as $x}
        <tr>
            <td>{$x.number|escape}</td>
            <td>{$x.name|escape}</td>
            <td>{$x.state|escape|capitalize}</td>
            {if $gr.can_dnd}
            <td>
                {include file=$tpl action='voip_dnd'}
                    <input type="hidden" name="extension" value="{$x.number|escape}">
                    <button type="submit" name="value" value="on" class="btn btn-xs btn-default">{$lang.on|escape}</button>
                    <button type="submit" name="value" value="off" class="btn btn-xs btn-default">{$lang.off|escape}</button>
                </form>
            </td>
            {/if}
        </tr>
    {/foreach}
    </tbody>
</table>
</div>
{else}
<p class="text-muted">{$lang.voip_no_extensions|escape}</p>
{/if}

{if $gr.emergency}
<h3>{$lang.voip_emergency|escape}</h3>
<div class="table-responsive">
<table class="table table-striped">
    <thead><tr>
        <th>{$lang.voip_number|escape}</th>
        <th>{$lang.voip_state|escape}</th>
        <th>{$lang.voip_address|escape}</th>
    </tr></thead>
    <tbody>
    {foreach $gr.emergency as $r}
        <tr>
            <td>{$r.number|escape}</td>
            <td>
                {if $r.status eq 'set'}{$lang.voip_999_set|escape}
                {elseif $r.status eq 'incomplete'}{$lang.voip_999_incomplete|escape}
                {else}{$lang.voip_999_missing|escape}{/if}
            </td>
            <td>{$r.address|escape}</td>
        </tr>
    {/foreach}
    </tbody>
</table>
</div>
{/if}

<p class="text-muted small">{$lang.refresh_note|escape}</p>

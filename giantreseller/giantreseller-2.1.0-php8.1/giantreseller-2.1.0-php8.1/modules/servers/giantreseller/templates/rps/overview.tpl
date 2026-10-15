{assign var=tpl value="`$smarty.current_dir`/../_action.tpl"}

<h3>{$lang.rps_devices|escape}</h3>
<p>
    {$lang.rps_quota|escape}:
    {if $gr.quota === null}{$lang.rps_unlimited|escape}{else}{$gr.quota_left|escape} / {$gr.quota|escape}{/if}
</p>

{if $gr.devices}
<div class="table-responsive">
<table class="table table-striped">
    <thead><tr>
        <th>{$lang.rps_manufacturer|escape}</th>
        <th>{$lang.rps_mac|escape}</th>
        <th>{$lang.rps_model|escape}</th>
        <th>{$lang.rps_name|escape}</th>
        <th>{$lang.rps_status|escape}</th>
        <th>{$lang.rps_synced|escape}</th>
        {if $gr.can_remove}<th></th>{/if}
    </tr></thead>
    <tbody>
    {foreach $gr.devices as $d}
        <tr>
            <td>{$d.manufacturer|escape|capitalize}</td>
            <td><code>{$d.mac|escape}</code></td>
            <td>{$d.model|escape}</td>
            <td>{$d.name|escape}</td>
            <td>{$d.status|escape|capitalize}</td>
            <td>{$d.synced|escape}</td>
            {if $gr.can_remove}
            <td>
                {if $d.status neq 'removed'}
                {include file=$tpl action='rps_remove'}
                    <input type="hidden" name="manufacturer" value="{$d.manufacturer|escape}">
                    <input type="hidden" name="mac" value="{$d.mac|escape}">
                    <button type="submit" class="btn btn-xs btn-danger">{$lang.rps_remove|escape}</button>
                </form>
                {/if}
            </td>
            {/if}
        </tr>
    {/foreach}
    </tbody>
</table>
</div>
{else}
<p class="text-muted">{$lang.rps_no_devices|escape}</p>
{/if}

{if $gr.can_add && $gr.manufacturers}
<h4>{$lang.rps_add|escape}</h4>
{include file=$tpl action='rps_add'}
    <div class="form-inline">
        <select name="manufacturer" class="form-control">
            {foreach $gr.manufacturers as $m}<option value="{$m|escape}">{$m|escape|capitalize}</option>{/foreach}
        </select>
        <input type="text" name="mac" class="form-control" placeholder="{$lang.rps_mac|escape}" maxlength="17" required pattern="[0-9A-Fa-f:\-\.]{literal}{12,17}{/literal}">
        <input type="text" name="serial" class="form-control" placeholder="{$lang.rps_serial|escape}" maxlength="64">
        <button type="submit" class="btn btn-primary">{$lang.rps_add|escape}</button>
    </div>
</form>
{/if}

<p class="text-muted small">{$lang.refresh_note|escape}</p>

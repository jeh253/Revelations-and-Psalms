<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="emo_lang/@tone">
            <sch:let name="allTypes" value="'righteousness', 'pleading', 'petitioning', 'anxiety', 'violence', 'praise', 'fear', 'boasting'"/>
            <sch:let name="myTypes" value="tokenize(.)"/>
           
            <sch:assert test="count($myTypes) eq count(distinct-values($myTypes))">@tone
                values cannot repeat</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
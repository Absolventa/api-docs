# HR-XML

```XML
<PositionOpening>
 <PositionPostings>
   <PositionPosting>
     <Id validFrom="2017-01-03" validTo="2017-12-10">
       <!-- Note that the ID is auto-assigned when using the RESTful API -->
       <IdValue>12345</IdValue>
     </Id>
     <Link><![CDATA[https://example.com/jobs/1]]></Link>
   </PositionPosting>
 </PositionPostings>
 <PositionProfile>
   <PositionDetail>
     <PhysicalLocation>
       <PostalAddress>
         <CountryCode>DE</CountryCode>
         <PostalCode>10405</PostalCode>
         <Municipality>Berlin</Municipality>
         <DeliveryAddress>
           <StreetName>Greifswader Straße</StreetName>
           <BuildingNumber>212</BuildingNumber>
         </DeliveryAddress>
       </PostalAddress>
     </PhysicalLocation>
     <PhysicalLocation>
       <PostalAddress>
         <CountryCode>DE</CountryCode>
         <PostalCode>10117</PostalCode>
         <Municipality>Berlin</Municipality>
         <DeliveryAddress>
           <StreetName>Friedrichsstraße</StreetName>
           <BuildingNumber>67</BuildingNumber>
         </DeliveryAddress>
       </PostalAddress>
     </PhysicalLocation>
     <PositionTitle><![CDATA[Trainee Web Development (m/w)]]></PositionTitle>
   </PositionDetail>
   <FormattedPositionDescription>
     <Name>Mode</Name>
     <Value>standard</Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>CompanyDescription</Name>
     <Value><![CDATA[<p>Basic HTML tags are allowed here</p>]]></Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>JobOfferDescription</Name>
     <Value>
       <![CDATA[<p>Basic HTML tags are allowed here</p>]]>
     </Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>TraineeGefluester</Name>
     <Value>1</Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>UseResponsiveTemplate</Name>
     <Value>true</Value>
   </FormattedPositionDescription>
   <FormattedPositionDescription>
     <Name>Height</Name>
     <Value>1234</Value>
   </FormattedPositionDescription>
   <HowToApply>
     <ApplicationMethod>
       <InternetWebAddress><![CDATA[https://example.com/jobs/1/apply]]></InternetWebAddress>
     </ApplicationMethod>
   </HowToApply>
  </PositionProfile>
</PositionOpening>
```

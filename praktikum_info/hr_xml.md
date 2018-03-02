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

### Data Fields

<table>
  <thead>
    <tr>
      <th>attribute</th>
      <th>value</th>
      <th>type</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        PositionPostings - PositionPosting - Link
      </td>
      <td>URL of custom layout to be displayed within an iframe</td>
      <td>String</td>
      <td>Optional</td>
    </tr>
    <tr>
      <td>
        PositionRecordInfo - IdValue
      </td>
      <td>Unique ID number our application uses internally for handling this record.</td>
      <td>String</td>
      <td><em>auto-assigned</em></td>
    </tr>
    <tr>
      <td>PositionTitle</td>
      <td>Title.</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>JobOfferDescription</td>
      <td>Description Text. Basic HTML tags (strong em u ol ul li p br a) are
      allowed, all other tags are going to get stripped out by our application.</td>
      <td>Text</td>
      <td>required</td>
    </tr>
    <tr>
      <td>PositionPosting - ValidFrom</td>
      <td>
        Date the job offer starts being published to our platform. Note that once the job offer has
        been published this field cannot be edited any longer. If left out, we immediately publish your
        job offer.
      </td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>PositionPosting - ValidTo</td>
      <td>Date on which the job offer stops being published to our platform.</td>
      <td>Datetime</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>CountryCode</td>
      <td>ISO code of the country of the location the job refers to.</td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>PostalCode</td>
      <td>Zip code of the location this job refers to.</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>Municipality</td>
      <td>City name of the location this job refers to.</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>StreetName</td>
      <td>Steet name of the location this job refers to.</td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>BuildingNumber</td>
      <td>Building number of the location this job refers to.</td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>InternetWebAddress</td>
      <td>URL pointing to your application system referencing this job</td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>Mode</td>
      <td>
        Possible values: <code>standard</code> and <code>premium</code>.
        Defaults to <code>standard</code> if omitted.
        Cannot be changed after creation.
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>TraineeGefluester</td>
      <td>
        <p>Allows co-publication of this job offer to our job board <a href="https://www.trainee-gefluester.de">trainee-gefluester.de</a> by supplying <code>true</code> or equivalently <code>1</code>. Note that a valid Trainee-Geflüster contract is required.</p>
        <p>Contact your account manager for activation.</p>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>CompanyDescription</td>
      <td>Description text of the company this job offer belongs to.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>UseResponsiveTemplate</td>
      <td>
        If you also submit an HTML representation of the job_offer (by submission of
        <code>Link</code>) and if your HTML representation behaves responsive, you
        can set this attribute to <code>true</code>. In this case the iframe serving
        your HTML content will be displayed for mobile devices, too. If left out or
        set to false, we will always render a text representation of the job offer.
      </td>
      <td>Boolean</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>Height</td>
      <td>Height of the iframe displaying the content of <code>Link</code> in px.</td>
      <td>Integer</td>
      <td>optional</td>
    </tr>
  </tbody>
</table>

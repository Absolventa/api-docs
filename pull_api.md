## Pull API
##### Documentation for Absolventa and Azubi.de

Our application is able to process data streams served via HTTP of different format. If you already have your
jobs wrapped into a custom data stream ready to read via HTTP, please [contact our team](mailto:api@absolventa.de) to verify
if we can handle it. <br>
Once a connection is established, we regularly (usually once a day) parse the provided feed and adjust the published job offers accordingly:
<ul>
  <li>Job offers present in the feed that are not yet published on our platform will be published.</li>
  <li>Job offers present in the feed that are already published on our platform will be updated according to the provided information.</li>
  <li>Job offers not present in the feed anymore but published on our platform will be quit.</li>
</ul>
Note that job offers can only be published if the booked contract allows for it. If a job offer is still present in a feed
after its runtime as specified by the contract is over, it will be treated as a new job offer (and hence get newly published
if the contract still allows for it).
If you want to connect to more than one of our platforms, please provide one feed per platform.

### Sample Data Format

Here's an ideal XML feed for our applications. If you are able to provide your job
data in this format, we can immediately configure a connection:

```XML
<?xml version='1.0' encoding='utf-8' ?>
<job_offers type='array'>
  <job_offer>
    <external_id>ABC-12345</external_id>
    <title>Seefahrer:in (w/m/d)</title>

    <application_email>elaine.marley@absolventa.de</application_email>
    <application_url><![CDATA[https://www.example.com/jobs/seefahrt/apply]]></application_url>
    <application_system_email>guybrush.threepwood@absolventa.de</application_system_email>

    <job_offer_locations>
      <job_offer_location>
        <city>Berlin</city>
        <street>Greifswalder Straße 212</street>
        <zip>10405</zip>
        <country>Deutschland</country>
      </job_offer_location>
    </job_offer_locations>

    <description_headline>Komm' an Bord!</description_headline>
    <description>
      <![CDATA[
        <p>
          Unser renormiertes Seefahrtsunternehmen heuert verlässlich und regelmäßig die besten
          Seefrauen und -männer (w/m/d) östlich des Atlantiks an. Generationen von Seefahrtsexperten
          haben ihre Karriere mit ersten nautischen Schritten in unserem Unternehmen gestartet.
        </p>
      ]]>
    </description>

    <tasks_headline>Du kannst im Schlaf unter tosendem Sturm problemlos Segel setzen?</tasks_headline>
    <tasks>
      <![CDATA[
        <ul>
          <li>Du peppst die rauhen und kantigen Geschichten unserer weltweit verstreuten Mitarbeiter linguistisch gekonnt auf</li>
          <li>Dein Instikt lässt dich spielerisch prüfbare Fakten von hanebüchenem Seemannsgarn unterscheiden</li>
        </ul>
      ]]>
    </tasks>

    <qualifications_headline>Du bist mutig genug, in allen Ozeanen dieser Welt zu schwimmen?</qualifications_headline>
    <qualifications>
      <![CDATA[
        <ul>
          <li>Du kannst schwimmen (Seepferdchen notwendig)</li>
          <li>Ein leichtes Schaukeln ist für dich kein Problem</li>
        </ul>
      ]]>
    </qualifications>

    <benefits_headline>Bestens ausgerüstet!</benefits_headline>
    <benefits>
      <![CDATA[
        <ul>
          <li>Reise zum Ende der Welt</li>
          <li>Ein loyales Team</li>
          <li>Remote first: Wir begrüßen ausdrücklich das eigenständige, asynchrone Arbeiten in entlegenen Gegenden</li>
        </ul>
      ]]>
    </benefits>

    <contact_headline>Frag' unsere Expertin Elaine!</contact_headline>
    <contact>
      <![CDATA[
        <p>Elaine Marley</p>
        <p>elaine.marley@absolventa.de</p>
        <small>Senior Seefahrt-Personalmanagerin</small>
      ]]>
    </contact>

    <company_description_headline>Unser Geschäft ist kein Voodoo!</company_description_headline>
    <company_description>
      <![CDATA[
        <p>Marley & Threepwood Ventures - Ihr Partner in Sachen Seefahrt- und Handelsbeziehungen</p>
      ]]>
    </company_description>

    <video_url><![CDATA[https://api.example.com/videos/seemannsgarn]]></video_url>
    <header_image_url><![CDATA[https://api.example.com/content/header_image.jpg]]></header_image_url>
    <color>#efefef</color>
    <custom_company_title>Threepwood GmbH</custom_company_title>

    <remote_work>required</remote_work>
    <work_experience>optional</work_experience>
    <work_hours>part_time</work_hours>
    <without_cover_letter>true</without_cover_letter>

    <!-- attributes only relevant for absolventa.de -->

    <!-- with fixed salary -->
    <salary_information_type>fixed</salary_information_type>
    <salary_type>monthly</salary_type>
    <salary_fixed>3000</salary_fixed>

    <!-- with salary range -->
    <salary_information_type>range</salary_information_type>
    <salary_type>yearly</salary_type>
    <salary_min>50000</salary_min>
    <salary_max>60000</salary_max>

    <!-- end of attributes only relevant for absolventa.de -->

    <!-- attributes only relevant for azubi.de -->

    <apprenticeship_started_at type='datetime'>
      2017-07-07T00:00:00+02:00
    </apprenticeship_started_at>
    <minimal_degree>basic</minimal_degree>
    <duration>36</duration>
    <salary_first_year>1000</salary_first_year>
    <salary_second_year>1200</salary_second_year>
    <salary_third_year>1400</salary_third_year>
    <salary_forth_year>1600</salary_forth_year>

    <!-- end of attributes only relevant for azubi.de -->

    <!-- attributes only relevant for agencies -->

    <company_title>Marley & Threepwood Ventures GmbH</company_title>
    <company_external_id>1234</company_external_id>
    <company_logo_url>https://api.example.com/company_logo.jpg</company_logo_url>
    <agency_order_number>12345abc</agency_order_number>

    <!-- end of attributes only relevant for agencies -->
  </job_offer>
  <job_offer>
    ...
  </job_offer>
</job_offers>
```
### Data fields

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
      <td>external_id</td>
      <td>Your internal identifier of the record. Has to be unique among published records and is not allowed to change.</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>title</td>
      <td>Title</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>application_email</td>
      <td>Email address potential candidates shall send their applications to.</td>
      <td>String</td>
      <td>required (Either application_url, application_email or application_system_email is needed. If several are provided, we prioritize application_url, then application_email.)</td>
    </tr>
    <tr>
      <td>application_url</td>
      <td>URL pointing to the application online formular of the job offer.</td>
      <td>String</td>
      <td>required (Either application_url, application_email or application_system_email is needed. If several are provided, we prioritize application_url, then application_email.)</td>
    </tr>
    <tr>
      <td>application_system_email</td>
      <td>Email address where applications are forwarded to from the job board's internal application system.</td>
      <td>String</td>
      <td>required (Either application_url, application_email or application_system_email is needed. If several are provided, we prioritize application_url, then application_email.)</td>
    </tr>
    <tr>
      <td>job_offer_locations</td>
      <td>
        List of job_offer_location objects. Each job_offer_location contained in the list
        has to include at least a <code>city</code> and a <code>zip</code> value.
        Usually, only one job_offer_location object is allowed.
      </td>
      <td>job_offer_location object</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>description_headline</td>
      <td>Headline summarizing the introductory description-content.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>description</td>
      <td>Description text of your job ad. Simple HTML tags such as <code>strong, em, u, i, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>required</td>
    </tr>
    <tr>
      <td>tasks_headline</td>
      <td>Headline summarizing the tasks-content.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>tasks</td>
      <td>Text summarizing the job tasks of the candiates. Simple HTML tags such as <code>strong, em, u, i, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>qualifications_headline</td>
      <td>Headline summarizing the introductory qualifications-content.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>qualifications</td>
      <td>Text summarizing the requirements of the candiates. Simple HTML tags such as <code>strong, em, u, i, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>benefits_headline</td>
      <td>Headline summarizing the benefits-content.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>benefits</td>
      <td>Text summarizing the job benefits of the candiates. Simple HTML tags such as <code>strong, em, u, i, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>contact_headline</td>
      <td>Headline summarizing the contact-content.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>contact</td>
      <td>Text summarizing the contact information for the candiates. Simple HTML tags such as <code>strong, em, u, i, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>company_description_headline</td>
      <td>Headline summarizing the company_description-content.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>company_description</td>
      <td>Description text of your company. Simple HTML tags such as <code>strong, em, u, i, ol, ul, li, p, br, a</code> are allowed.</td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>video_url</td>
      <td>URL to embeddable video content.</td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>header_image_url</td>
      <td>
        URL to image that is being displayed at the top of the job ad.
        <ul>
          <li>Image resolution: 2340 x 936 px (5:2 aspect ratio)</li>
          <li>Max. file size: 1 MB</li>
          <li>Formats: jpg, png</li>
        </ul>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>color</td>
      <td>Hex code for headline color.</td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>custom_company_title</td>
      <td>Custom company title, e.g. to display a specific branch's or subsidiary's name.</td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>remote_work</td>
      <td>
        Possibilities to work remotely.
        Possible values:
        <ul>
          <li><code>optional</code></li>
          <li><code>required</code> </li>
          <li><code>unavailable</code></li>
        </ul>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>work_experience</td>
      <td>
        Prior work experience.
        Possible values:
        <ul>
          <li><code>optional</code></li>
          <li><code>preferred</code> </li>
          <li><code>required</code></li>
        </ul>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>work_hours</td>
      <td>
        Part-time or full-time position.
        Possible values:
        <ul>
          <li><code>full_time</code></li>
          <li><code>optionally_part_time</code> </li>
          <li><code>part_time</code></li>
        </ul>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>without_cover_letter</td>
      <td>
        Whether cover letter can be omitted. <code>true</code> or <code>false</code> (as strings) are possible values. Defaults to <code>false</code>, i.e. application requires cover letter.
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <th colspan="4">Attributes only relevant for absolventa.de:</th>
    </tr>
    <tr>
      <td>salary_information_type</td>
      <td>
        Type of salary information. Possible values:
        <ul>
          <li><code>fixed</code> (Precise, fixed salary information available)</li>
          <li><code>range</code> (Salary information available as a range of two values)</li>
        </ul>
        Will default to an unset value <code>not_set</code>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
      <td>salary_type</td>
      <td>
        Type of given salary.
        Possible values:
        <ul>
          <li><code>yearly</code></li>
          <li><code>monthly</code></li>
          <li><code>hourly</code></li>
        </ul>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>salary_fixed</td>
      <td>
        The fixed salary in EUR.
      </td>
      <td>Integer</td>
      <td>only required if <code>salary_information_type</code> is <code>fixed</code></td>
    <tr>
    <tr>
      <td>salary_min</td>
      <td>
        The lower bound of the salary range in EUR.
      </td>
      <td>Integer</td>
      <td>only required if <code>salary_information_type</code> is <code>range</code></td>
    <tr>
    <tr>
      <td>salary_max</td>
      <td>
        The upper bound of the salary range in EUR.
      </td>
      <td>Integer</td>
      <td>only required if <code>salary_information_type</code> is <code>range</code></td>
    <tr>
    <tr>
      <th colspan="4">Attributes only relevant for azubi.de:</th>
    </tr>
    <tr>
      <td>apprenticeship_started_at</td>
      <td>Date on which the apprenticeship will start.</td>
      <td>Datetime</td>
      <td>required for azubi.de</td>
    </tr>
      <td>minimal_degree</td>
      <td>
        Minimal graduation degree the candidates should own.
        Possible values:
        <ul>
          <li><code>basic</code> (Hauptschulabschluss)</li>
          <li><code>certificate</code> (Mittlere Reife)</li>
          <li><code>graduation</code> ([Fach-]Abitur)</li>
        </ul>
      </td>
      <td>String</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>duration</td>
      <td>
        Duration of the apprenticeship in months.
      </td>
      <td>Integer</td>
      <td>optional</td>
    <tr>
    <tr>
      <td>salary_first_year</td>
      <td>
        Salary during the first year of the apprenticeship. The second, third, and forth years can be added in the same way, eg. <code>salary_second_year</code>, etc.
      </td>
      <td>Integer</td>
      <td>optional</td>
    <tr>
  </tbody>
</table>

### Additional data fields for agencies
These fields are only relevant for customers that post job offers on behalf of multiple companies.
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
      <td>company_title</td>
      <td>The name of the company for which the job is posted.</td>
      <td>String</td>
      <td>required</td>
    </tr>
    <tr>
      <td>company_external_id</td>
      <td>Your internal, unique identifier of the company. Should remain consistent across all job offers for the same company.</td>
      <td>String</td>
      <td>required (If you don't use IDs, the <code>company_title</code> can be given.) </td>
    </tr>
    <tr>
      <td>company_logo_url</td>
      <td>URL to the company's logo image to be displayed with the job posting.
        <ul>
          <li>Image resolution: min. 400 x 400 px</li>
          <li>Formats: jpg, png</li>
        </ul>
      </td>
      <td>Text</td>
      <td>optional</td>
    </tr>
    <tr>
      <td>agency_order_number</td>
      <td>Order number</td>
      <td>String</td>
      <td>optional</td>
    </tr>
  </tbody>
</table>
export namespace main {
	
	export class MinimalType {
	    typename: string;
	    filename: string;
	
	    static createFrom(source: any = {}) {
	        return new MinimalType(source);
	    }
	
	    constructor(source: any = {}) {
	        if ('string' === typeof source) source = JSON.parse(source);
	        this.typename = source["typename"];
	        this.filename = source["filename"];
	    }
	}
	export class SchemaResult {
	    data: MinimalType[];
	    error: any;
	
	    static createFrom(source: any = {}) {
	        return new SchemaResult(source);
	    }
	
	    constructor(source: any = {}) {
	        if ('string' === typeof source) source = JSON.parse(source);
	        this.data = this.convertValues(source["data"], MinimalType);
	        this.error = source["error"];
	    }
	
		convertValues(a: any, classs: any, asMap: boolean = false): any {
		    if (!a) {
		        return a;
		    }
		    if (a.slice && a.map) {
		        return (a as any[]).map(elem => this.convertValues(elem, classs));
		    } else if ("object" === typeof a) {
		        if (asMap) {
		            for (const key of Object.keys(a)) {
		                a[key] = new classs(a[key]);
		            }
		            return a;
		        }
		        return new classs(a);
		    }
		    return a;
		}
	}

}

export namespace utils {
	
	export class Field {
	    name: string;
	    defaultValue: string;
	    javaType: string;
	    gqlType: string;
	
	    static createFrom(source: any = {}) {
	        return new Field(source);
	    }
	
	    constructor(source: any = {}) {
	        if ('string' === typeof source) source = JSON.parse(source);
	        this.name = source["name"];
	        this.defaultValue = source["defaultValue"];
	        this.javaType = source["javaType"];
	        this.gqlType = source["gqlType"];
	    }
	}
	export class ExtractedType {
	    typeName: string;
	    fields: Field[];
	
	    static createFrom(source: any = {}) {
	        return new ExtractedType(source);
	    }
	
	    constructor(source: any = {}) {
	        if ('string' === typeof source) source = JSON.parse(source);
	        this.typeName = source["typeName"];
	        this.fields = this.convertValues(source["fields"], Field);
	    }
	
		convertValues(a: any, classs: any, asMap: boolean = false): any {
		    if (!a) {
		        return a;
		    }
		    if (a.slice && a.map) {
		        return (a as any[]).map(elem => this.convertValues(elem, classs));
		    } else if ("object" === typeof a) {
		        if (asMap) {
		            for (const key of Object.keys(a)) {
		                a[key] = new classs(a[key]);
		            }
		            return a;
		        }
		        return new classs(a);
		    }
		    return a;
		}
	}

}

